note
	description: "[
		 	Containing configuration options for the parser.
 			These let you specify alternate memory managers, provide different error
 			handling, etc.
 			Use kGumboDefaultOptions for sensible defaults, and only set what you need.
 		]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GP_OPTIONS

feature -- C externals


	c_userdata (p: POINTER): POINTER
			-- An opaque object that's passed in as the first argument to all callbacks
			-- used by this library.  Default: NULL.
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboOptions *)$p)->userdata; "
		end

	c_tab_stop (p: POINTER): INTEGER
			-- The tab-stop size, for computing positions in source code that uses tabs.
			-- Default: 8.
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboOptions *)$p)->tab_stop; "
		end

	c_stop_on_first_error (p: POINTER): INTEGER
			-- The tab-stop size, for computing positions in source code that uses tabs.
			-- Default: 8.
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboOptions *)$p)->stop_on_first_error; "
		end

	c_max_errors (p: POINTER): INTEGER
				-- The maximum number of errors before the parser stops recording them.  This
				-- is provided so that if the page is totally borked, we don't completely fill
				-- up the errors vector and exhaust memory with useless redundant errors.  Set
				-- to -1 to disable the limit.
				--  Default: -1
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboOptions *)$p)->max_errors; "
		end

end
