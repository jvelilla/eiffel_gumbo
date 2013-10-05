note
	description: "[
				 * A simple vector implementation.  This stores a pointer to a data array and a
				 * length.  All elements are stored as void*; client code must cast to the
				 * appropriate type.  Overflows upon addition result in reallocation of the data
				 * array, with the size doubling to maintain O(1) amortized cost.  There is no
				 * removal function, as this isn't needed for any of the operations within this
				 * library.  Iteration can be done through inspecting the structure directly in
				 * a for-loop.
				 */
				typedef struct {
				  /** Data elements.  This points to a dynamically-allocated array of capacity
				   * elements, each a void* to the element itself.
				   */
				  void** data;

				  /** Number of elements currently in the vector. */
				  unsigned int length;

				  /** Current array capacity. */
				  unsigned int capacity;
				} GumboVector;

			]"
	date: "$Date$"
	revision: "$Revision$"

class
	GP_VECTOR

create
	make_by_pointer

feature {NONE} -- Initialization

	make_by_pointer (a_pointer:POINTER)
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

	count: NATURAL
			-- Number of elements
		do
			Result := c_length (item)
		end

	capacity: NATURAL
			-- Current capacity
		do
			Result := c_capacity (item)
		end

	at (a_index: NATURAL): POINTER
			-- Entry at index `a_index', if in index interval
		require
			is_valid_index:  a_index > 0 and then a_index <= count
		do
			Result := c_at (item, (a_index - 1))
		end

feature {NONE} -- Implementation

	c_data (p: POINTER): POINTER
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return (void **)((GumboVector *) $p)->data;"
    	end

    c_length (p: POINTER): NATURAL
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return ((GumboVector *) $p)->length;"
    	end

    c_capacity (p: POINTER): NATURAL
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return ((GumboVector *) $p)->capacity;"
    	end

	c_gumbo_vector_index_of (a_vector: POINTER; a_element: POINTER): INTEGER
			--  Returns the first index at which an element appears in this vector (testing
			--  by pointer equality), or -1 if it never does.
			--  int gumbo_vector_index_of(GumboVector* vector, void* element);
		require
			vector_not_null: a_vector /= default_pointer
			element_not_null: a_element /= default_pointer
	   	external
	    	"C inline use <gumbo.h>"
	    alias
	    	"return gumbo_vector_index_of((GumboVector*)$a_vector, (void*)$a_element);"
	    end

	c_at (p: POINTER; a_index: NATURAL): POINTER
			-- Entry at index `a_index', if in index interval
		external
			"C inline use <gumbo.h>"
		alias
			"return (void *)(((GumboVector *) $p)->data[$a_index]);"
		end

end
