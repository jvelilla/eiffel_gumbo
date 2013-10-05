note
	description: "The output containing the results of the parse."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GP_OUTPUT

create
	make_by_pointer

feature {NONE} -- Initialization

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
		-- Access to memory area


	document: detachable GP_NODE
			-- Document node
		local
			l_pointer: POINTER
		do
			l_pointer := c_document (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	root: detachable GP_NODE
			-- Root node
		local
			l_pointer: POINTER
		do
			l_pointer := c_root (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	errors: detachable GP_VECTOR
			-- List of errors during parse
		local
			l_pointer: POINTER
		do
			l_pointer := c_errors (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

feature {NONE} -- C external


	c_document (p: POINTER): POINTER
			-- Pointer to the document node.  This is a GumboNode of type NODE_DOCUMENT
			-- that contains the entire document as its child.
			--
			-- GumboNode* document;
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return (((GumboOutput *) $p)->document);"
		end

	c_root (p: POINTER): POINTER
			-- Pointer to the root node.  This the <html> tag that forms the root of the
			-- document.
			--
			-- GumboNode* root;
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return (((GumboOutput *) $p)->root);"
		end

	c_errors (p: POINTER): POINTER
			-- A list of errors that occurred during the parse.
			-- NOTE: In version 1.0 of this library, the API for errors hasn't been fully
			-- fleshed out and may change in the future.  For this reason, the GumboError
			-- header isn't part of the public API.  Contact us if you need errors
			-- reported so we can work out something appropriate for your use-case.
			--
			-- GumboVector /* GumboError */ errors;
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return &(((GumboOutput *) $p)->errors);"
		end
end
