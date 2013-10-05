note
	description: "Information specific to document nodes"
	date: "$Date$"
	revision: "$Revision$"

class
	GP_DOCUMENT

create
	make_by_pointer

feature {NONE} --Initialization

	make_by_pointer (a_pointer: POINTER)
		require
			a_pointer_not_null: a_pointer /= default_pointer
		do
			item := a_pointer
		ensure
			item_set: item = a_pointer
		end

feature -- Access

	item: POINTER
			-- Access memory area.

	children: detachable GP_VECTOR
			-- Containing the children of this element.
		local
			l_pointer: POINTER
		do
			l_pointer := c_children (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	has_doctype: BOOLEAN
			-- is there explicit doctype?
		do
			Result := c_has_doctype (item)
		end

	name: detachable STRING
			-- 	doctype token name
		local
			l_pointer: POINTER
			l_cstring: C_STRING
		do
			l_pointer := c_name (item)
			if l_pointer /= default_pointer then
				create l_cstring.make_by_pointer (l_pointer)
				Result := l_cstring.string
			end
		end


	public_identifier: detachable STRING
			-- 	doctype token public identifier
		local
			l_pointer: POINTER
			l_cstring: C_STRING
		do
			l_pointer := c_public_identifier (item)
			if l_pointer /= default_pointer then
				create l_cstring.make_by_pointer (l_pointer)
				Result := l_cstring.string
			end
		end

	-- . DOCTYPE tokens have a name, a public identifier, a system identifier, and a force-quirks flag. 	

	system_identifier: detachable STRING
			-- 	doctype token system identifier
		local
			l_pointer: POINTER
			l_cstring: C_STRING
		do
			l_pointer := c_system_identifier (item)
			if l_pointer /= default_pointer then
				create l_cstring.make_by_pointer (l_pointer)
				Result := l_cstring.string
			end
		end


	force_quirks_flag: 	GP_QUIRKS_MODE
			-- doctype token force-quirks flags
		do
			create Result.make_by_value (c_doc_type_quirks_mode (item))
		end

feature {NONE} -- C External

  	c_children (p: POINTER): POINTER
				-- An array of GumboNodes, containing the children of this element.  This will
				-- normally consist of the <html> element and any comment nodes found.
				-- Pointers are owned.

				-- GumboVector children;
  		require
  			p_not_null: p /= default_pointer
  		external
  			"C inline use <gumbo.h>"
  		alias
			"return &(((GumboDocument *) $p)->children);"
		end

	c_has_doctype (p: POINTER): BOOLEAN
				--  True if there was an explicit doctype token as opposed to it being omitted.
				--  bool has_doctype;
  		require
  			p_not_null: p /= default_pointer
  		external
  			"C inline use <gumbo.h>"
  		alias
			"return ((GumboDocument *) $p)->has_doctype;"
		end

	c_name (p: POINTER): POINTER
  		require
  			p_not_null: p /= default_pointer
  		external
  			"C inline use <gumbo.h>"
  		alias
			"return ((GumboDocument *) $p)->name;"
		end

	c_public_identifier (p: POINTER): POINTER
  		require
  			p_not_null: p /= default_pointer
  		external
  			"C inline use <gumbo.h>"
  		alias
			"return ((GumboDocument *) $p)->public_identifier;"
		end

	c_system_identifier (p: POINTER): POINTER
  		require
  			p_not_null: p /= default_pointer
  		external
  			"C inline use <gumbo.h>"
  		alias
 			"return ((GumboDocument *) $p)->system_identifier;"
		end


	c_doc_type_quirks_mode (p: POINTER): INTEGER
  		require
  			p_not_null: p /= default_pointer
  		external
  			"C inline use <gumbo.h>"
  		alias
 			"return ((GumboDocument *) $p)->doc_type_quirks_mode;"
		end

end
