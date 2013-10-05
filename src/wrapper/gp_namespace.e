note
	description: "[
					Namespaces.
 					Unlike in X(HT)ML, namespaces in HTML5 are not denoted by a prefix.  Rather,
 					anything inside an <svg> tag is in the SVG namespace, anything inside the
 					<math> tag is in the MathML namespace, and anything else is inside the HTML
 					namespace.  No other namespaces are supported, so this can be an enum only.
				]"
	date: "$Date$"
	revision: "$Revision$"

class
	GP_NAMESPACE

inherit

	ENUM

create
	make_by_value

feature {NONE} -- Initialization

	make_by_value (a_value: INTEGER)
		require
			is_valid: is_valid_value (a_value)
		do
			set_value (a_value)
		ensure
			value_set: value = a_value
		end

feature -- Access

	is_valid_value (a_value: INTEGER): BOOLEAN
			-- <Precursor>
		do
			Result := (a_value = c_gumbo_namespace_html) or else
					(a_value = c_gumbo_namespace_svg) or else
					(a_value = c_gumbo_namespace_mahtml)
		end

	is_gumbo_namespace_html: BOOLEAN
		do
			Result := (value = c_gumbo_namespace_html)
		end

	is_gumbo_namespace_svg: BOOLEAN
		do
			Result := (value = c_gumbo_namespace_svg)
		end

	is_gumbo_namespace_mahtml: BOOLEAN
		do
			Result := (value = c_gumbo_namespace_mahtml)
		end

feature {NONE} -- C externals

	c_gumbo_namespace_html: INTEGER
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_NAMESPACE_HTML"
		end

	c_gumbo_namespace_svg: INTEGER
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_NAMESPACE_SVG"
		end

	c_gumbo_namespace_mahtml: INTEGER
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_NAMESPACE_MATHML"
		end

end
