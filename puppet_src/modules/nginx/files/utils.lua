local utils = {}

-- src: http://lua-users.org/wiki/SplitJoin
function utils.string_split(s,d)
  local t, ll
  t={}
  ll=0
  if(#s == 1) then return {s} end
	while true do
	  l=string.find(s,d,ll,true) -- find the next d in the string
	  if l~=nil then -- if "not not" found then..
	    table.insert(t, string.sub(s,ll,l-1)) -- Save it in our array.
	    ll=l+1 -- save just after where we found it for searching next time.
	  else
	    table.insert(t, string.sub(s,ll)) -- Save what's left in our array.
	    break -- Break at end, as it should be, according to the lua manual.
	  end
	end
  return t
end

return utils