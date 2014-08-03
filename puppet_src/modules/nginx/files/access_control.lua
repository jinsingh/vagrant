local common = require 'lua_scripts/common'

ngx.log(ngx.NOTICE, 'BEGIN access_control.lua')

if
   string.find(ngx.var.uri, "^/authentication_endpoint$") or
   string.find(ngx.var.uri, "^/login$") or
   string.find(ngx.var.uri, "^/login/pre_authenticate$") or
   string.find(ngx.var.uri, "^/logout$") or
   string.find(ngx.var.uri, "^/assets.*$") or
   string.find(ngx.var.uri, "^/error/.*$") or
   string.find(ngx.var.uri, "^/register/.*$") or
   string.find(ngx.var.uri, "^/account/unverified$") or
   string.find(ngx.var.uri, "^/account/unverified_login$") or
   string.find(ngx.var.uri, "^/account/set_password/.*$") or
   string.find(ngx.var.uri, "^/account/verify/.*$") or
   string.find(ngx.var.uri, "^/account/reset_password_confirmation$") or
   string.find(ngx.var.uri, "^/help") or
   string.find(ngx.var.uri, "^/cookies") or
   string.find(ngx.var.uri, "^/contact") or
   string.find(ngx.var.uri, "^/feedback") or
   string.find(ngx.var.uri, "^/register$") or
   string.find(ngx.var.uri, "^/robots.txt$") or
   string.find(ngx.var.uri, "^/lostVerificationCode$") or
   string.find(ngx.var.uri, "^/matching$") or
   string.find(ngx.var.uri, "^/ida$") or
   string.find(ngx.var.uri, "^/ida/.*$") or
   string.find(ngx.var.uri, "^/ida%-matching%-service$") or
   string.find(ngx.var.uri, "^/ida%-matching%-service/.*$") or
   string.find(ngx.var.uri, "^/ida%-register$") or
   string.find(ngx.var.uri, "^/auth/ida/request$") or
   string.find(ngx.var.uri, "^/start%-login$") or
   string.find(ngx.var.uri, "^/ida%-private%-beta$") or
   string.find(ngx.var.uri, "^/matching%-service/SAML2/metadata$") or
   string.find(ngx.var.uri, "^/msa$") or
   string.find(ngx.var.uri, "^/ida_beta_token_validation$") or
   string.find(ngx.var.uri, "^/account%-locked$") or
   string.find(ngx.var.uri, "^/hippo.*$") 
   then
      ngx.log(ngx.INFO, 'Trying to access non protected resource. Letting through')
   return
end

local access_token = ngx.var.cookie_CapdAccessToken

if not access_token then
	ngx.log(ngx.WARN, 'No access token!')

   ngx.header["X-Frame-Options"] = 'sameorigin'
   ngx.header["X-XSS-Protection"] = '1'
   ngx.header["X-Content-Type-Options"] = 'nosniff'

	ngx.exit(401)
end

ngx.log(ngx.INFO, 'CapdAccessToken: ' .. access_token)

local accept_encoding_header_tmp = ngx.req.get_headers()["Accept-Encoding"]
ngx.req.clear_header("Accept-Encoding")

local auth_service_res = ngx.location.capture('/api/internal-auth/session/' .. access_token);
local user_context = common.user_context_from_body(auth_service_res.body);
ngx.req.set_header('Accept-Encoding', accept_encoding_header_tmp)

print(ngx.INFO, 'auth_service_res.status = ' .. auth_service_res.status)

if auth_service_res.status ~= ngx.HTTP_OK then
	ngx.log(ngx.WARN, 'Nginx was unable to get callerId for '.. access_token ..' from internal authentication service')

   ngx.header["X-Frame-Options"] = 'sameorigin'
   ngx.header["X-XSS-Protection"] = '1'
   ngx.header["X-Content-Type-Options"] = 'nosniff'

	ngx.exit(401)
end

ngx.log(ngx.INFO, 'caller_id = ' .. user_context.caller_id .. ' user_type = ' .. user_context.user_type)

ngx.req.set_header('callerId', user_context.caller_id)
ngx.req.set_header('userType', user_context.user_type)
