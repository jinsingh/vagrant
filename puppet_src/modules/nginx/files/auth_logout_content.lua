ngx.log(ngx.NOTICE, 'BEGIN auth_logout_content.lua')

function delete_cookies(cookies_to_delete)
  local set_cookie_strings = {}

  for k, cookie_name in pairs(cookies_to_delete) do
    local set_cookie_string = cookie_name .. '=deleted; path=/; Expires=Thu, 01-Jan-1970 00:00:01 GMT'
    ngx.log(ngx.INFO, 'Deleting cookie ' .. cookie_name)
    table.insert(set_cookie_strings, set_cookie_string)
  end

  ngx.header['Set-Cookie'] = set_cookie_strings
end

local access_token = ngx.var.cookie_CapdAccessToken;

if access_token == nil then
  ngx.log(ngx.WARN, 'Unable to delete capd session since token is nil. Will just destroy play session.')
  delete_cookies({'PLAY_SESSION'})
  return ngx.redirect('/')
end

local session_service_delete_res = ngx.location.capture('/api/internal-auth/session/' .. access_token, { method = ngx.HTTP_DELETE })

if session_service_delete_res.status ~= ngx.HTTP_OK then
  ngx.log(ngx.ERR, 'Could not delete session from internal-auth. Will delete cookies anyway.')
end

delete_cookies({'CapdAccessToken', 'PLAY_SESSION'})

ngx.log(ngx.NOTICE, 'Redirecting to IDA login url')
return ngx.redirect('/')