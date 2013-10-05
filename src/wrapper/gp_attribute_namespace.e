note
	description: "[
					Attribute namespaces.
 					HTML includes special handling for XLink, XML, and XMLNS namespaces on
 					attributes.  Everything else goes in the generatic "NONE" namespace.
					]"
	date: "$Date$"
	revision: "$Revision$"

class
	GP_ATTRIBUTE_NAMESPACE

inherit

	ENUM

create
	make_by_value

feature -- Initialization

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
			Result := (a_value = c_gumbo_attr_namespace_none) or else
					(a_value = c_gumbo_attr_namespace_xml) or else
					(a_value = c_gumbo_attr_namespace_xlink) or else
					(a_value = c_gumbo_attr_namespace_xmlns)
		end


	is_gumbo_attr_namespace_none: BOOLEAN
		do
			Result := (value = c_gumbo_attr_namespace_none)
		end

	is_gumbo_attr_namespace_xml: BOOLEAN
		do
			Result := (value = c_gumbo_attr_namespace_xml)
		end

	is_gumbo_attr_namespace_xlink: BOOLEAN
		do
			Result := (value = c_gumbo_attr_namespace_xlink)
		end

	is_gumbo_attr_namespace_xmlns: BOOLEAN
		do
			Result := (value = c_gumbo_attr_namespace_xmlns)
		end


feature {NONE} -- C EXTERNALS

	c_gumbo_attr_namespace_none: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_ATTR_NAMESPACE_NONE"
		end


	c_gumbo_attr_namespace_xml: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_ATTR_NAMESPACE_XML"
		end


	c_gumbo_attr_namespace_xlink: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_ATTR_NAMESPACE_XLINK"
		end

	c_gumbo_attr_namespace_xmlns: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_ATTR_NAMESPACE_XMLNS"
		end

end
