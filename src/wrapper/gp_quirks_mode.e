note
	description: "Summary description for {GP_QUIRKS_MODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name= quirks mode", "src=http://www.whatwg.org/specs/web-apps/current-work/complete/dom.html#quirks-mode", "protocol=uri"
class
	GP_QUIRKS_MODE

inherit

	ENUM

create
	make_by_value

feature {NONE} -- Initialization

	make_by_value (a_value:INTEGER)
		require
			is_valid: is_valid_value (a_value)
		do
			set_value (a_value)
		ensure
			value_set: value = a_value
		end

feature -- Access

	is_valid_value (a_value:INTEGER): BOOLEAN
			-- <Precursor>
		do
			Result := (a_value = c_gumbo_doctype_no_quirks) or else
					(a_value = c_gumbo_doctype_quirks) or else
					(a_value = c_gumbo_doctype_limited_quirks)
		end

	is_gumbo_doctype_no_quirks: BOOLEAN
		do
			Result := (value = c_gumbo_doctype_no_quirks)
		end

	is_gumbo_doctype_quirks: BOOLEAN
		do
			Result := (value = c_gumbo_doctype_quirks)
		end

	is_gumbo_doctype_limited_quirks: BOOLEAN
		do
			Result := (value = c_gumbo_doctype_limited_quirks)
		end

feature {NONE} -- C externals

	c_gumbo_doctype_no_quirks: INTEGER
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_DOCTYPE_NO_QUIRKS"
		end

	c_gumbo_doctype_quirks: INTEGER
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_DOCTYPE_QUIRKS"
		end

	c_gumbo_doctype_limited_quirks: INTEGER
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_DOCTYPE_LIMITED_QUIRKS"
		end

end
