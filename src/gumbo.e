note
	description: "Summary description for {GUMBO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GUMBO

feature -- Parse

	gumbo_parse (a_input: STRING): detachable GP_OUTPUT
		local
			l_cstring: C_STRING
			l_pointer: POINTER
		do
			create l_cstring.make (a_input)
			l_pointer := c_gumbo_parse (l_cstring.item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

feature -- C external

	c_gumbo_parse (a_buffer: POINTER): POINTER
			--/**
			-- * Parses a buffer of UTF8 text into an GumboNode parse tree.  The buffer must
			-- * live at least as long as the parse tree, as some fields (eg. original_text)
			-- * point directly into the original buffer.
			-- *
			-- * This doesn't support buffers longer than 4 gigabytes.
			-- */
			-- GumboOutput* gumbo_parse(const char* buffer);
		require
			a_buffer_not_null: a_buffer /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"{
			  GumboOutput* l_val;
			  l_val = gumbo_parse((const char *)$a_buffer);
			  return (EIF_REFERENCE) l_val;
			  }"
		end

	c_gumbo_parse_with_options	(a_options: POINTER; a_buffer: POINTER; a_buffer_length:INTEGER): POINTER
			-- Extended version of gumbo_parse that takes an explicit options structure,
			-- buffer, and length.
			--
			-- GumboOutput* gumbo_parse_with_options(
			--   const GumboOptions* options, const char* buffer, size_t buffer_length);
		require
			a_options_not_null: a_options /= default_pointer
			a_buffer_not_null: a_buffer /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboOutput*) gumbo_parse_with_options((const GumboOptions*) $a_options, (const char*) $a_buffer, (size_t)$a_buffer_length);"
		end


	c_gumbo_destroy_output (a_options: POINTER; a_output:POINTER)
			-- Release the memory used for the parse tree & parse errors. */
			-- Void gumbo_destroy_output(
			--    const GumboOptions* options, GumboOutput* output);
		require
			a_options_not_null: a_options /= default_pointer
			a_output_not_null: a_output /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return gumbo_destroy_output ((const GumboOptions*)$a_options, (GumboOutput*)$a_output);"
		end

end
