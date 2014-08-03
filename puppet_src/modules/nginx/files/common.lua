local utils = require 'lua_scripts/utils'

local user_context_delimiter = '|'

local common = {}

function common.user_context_from_body(body)
	ngx.log(ngx.INFO, 'Converting user context from body =' .. body)
	split_body = utils.string_split(body, user_context_delimiter)
	return {caller_id = split_body[1], user_type = split_body[2], sessionType = split_body[3]}
end

function common.body_from_user_context(user_context)
	return user_context.caller_id .. user_context_delimiter .. user_context.user_type
end

return common
