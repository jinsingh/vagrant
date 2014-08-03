local common = require 'lua_scripts/common'

ngx.log(ngx.NOTICE, 'BEGIN ida_private_beta_token_validation.lua')

if ngx.var['arg_token'] == nil or ngx.var['arg_token'] == '' then
    ngx.log(ngx.NOTICE, 'Redirecting to IDA landing page with missing token error message')
    ngx.redirect('/start-login?message=missing-token')
else
    local token_validation_res = ngx.location.capture('/ida_beta_token_validation/tokens/' .. ngx.var['arg_token'] .. '/validate', { method = ngx.HTTP_POST })

    if token_validation_res.status ~= ngx.HTTP_OK then
        ngx.log(ngx.ERR, 'Redirecting to IDA landing page with error message for unable to validate')
        ngx.redirect('/start-login?message=unable-token')
    else
        if string.find(token_validation_res.body, 'true') then
            ngx.log(ngx.NOTICE, 'Valid beta token, allowing request through to start IDA login')
            return
        elseif string.find(token_validation_res.body, 'EXPIRED') then
            ngx.log(ngx.NOTICE, 'Redirecting to IDA landing page with EXPIRED error message')
            ngx.redirect('/start-login?message=expired-token')
        elseif string.find(token_validation_res.body, 'REVOKED') then
            ngx.log(ngx.NOTICE, 'Redirecting to IDA landing page with REVOKED error message')
            ngx.redirect('/start-login?message=revoked-token')
        elseif string.find(token_validation_res.body, 'OVERUSED') then
            ngx.log(ngx.NOTICE, 'Redirecting to IDA landing page with OVERUSED error message')
            ngx.redirect('/start-login?message=overused-token')
        else
            ngx.log(ngx.ERR, 'Redirecting to IDA landing page with error message for unknown response: ' .. token_validation_res.body)
            ngx.redirect('/start-login?message=unable-token')
        end
    end
end