note
	description: "[
				 * An enum for all the tags defined in the HTML5 standard.  These correspond to
				 * the tag names themselves.  Enum constants exist only for tags which appear in
				 * the spec itself (or for tags with special handling in the SVG and MathML
				 * namespaces); any other tags appear as GUMBO_TAG_UNKNOWN and the actual tag
				 * name can be obtained through original_tag.
				 *
				 * This is mostly for API convenience, so that clients of this library don't
				 * need to perform a strcasecmp to find the normalized tag name.  It also has
				 * efficiency benefits, by letting the parser work with enums instead of
				 * strings.
 				]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Root Element", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/semantics.html#the-root-element", "protocol=uri"
	EIS: "name=Document Metadata", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/semantics.html#document-metadata", "protocol=uri"
	EIS: "name=Scripting 1", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/scripting-1.html#scripting-1", "protocol=uri"
	EIS: "name=Sections", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/sections.html#sections", "protocol=uri"
	EIS: "name=Grouping content", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/grouping-content.html#grouping-content", "protocol=uri"
	EIS: "name=Text level semantics", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/text-level-semantics.html#text-level-semantics", "protocol=uri"
	EIS: "name=Edits", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/edits.html#edits", "protocol=uri"
	EIS: "name=Embeded content 1", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/embedded-content-1.html#embedded-content-1","protocol=uri"
	EIS: "name=Mahtml", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/the-map-element.html#mathml","protocol=uri"
	EIS: "name=Svg", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/the-map-element.html#svg-0", "protocol=uri"
	EIS: "name=Tabular data", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/tabular-data.html#tabular-data","protocol=uri"
	EIS: "name=Forms","src=http://www.whatwg.org/specs/web-apps/current-work/multipage/forms.html#forms","protocol=uri"
	EIS: "name=Interactive elements", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/interactive-elements.html#interactive-elements","protocol=uri"
	EIS: "name=Non conforming features", "src=http://www.whatwg.org/specs/web-apps/current-work/multipage/obsolete.html#non-conforming-features","protocol=uri"
class
	GP_TAG

inherit

	ENUM

create
	make_by_value,
	make_unknown

feature -- Initialization

	make_by_value (a_value: INTEGER)
		require
			is_valid: is_valid_value (a_value)
		do
			set_value (a_value)
		ensure
			value_set: value = a_value
		end

	make_unknown
		do
			set_value (c_gumbo_tag_unknown)
		ensure
			value_set: value = c_gumbo_tag_unknown
		end


feature -- Access

	is_valid_value (a_value: INTEGER): BOOLEAN
			-- <Precursor>
		do
			Result := (a_value = c_gumbo_tag_html) or else
					  (a_value = c_gumbo_tag_head) or else
					  (a_value = c_gumbo_tag_title) or else
					  (a_value = c_gumbo_tag_base) or else
					  (a_value = c_gumbo_tag_link) or else
					  (a_value = c_gumbo_tag_meta) or else
					  (a_value = c_gumbo_tag_style) or else
					  (a_value = c_gumbo_tag_body) or else
					  (a_value = c_gumbo_tag_section) or else
					  (a_value = c_gumbo_tag_nav) or else
					  (a_value = c_gumbo_tag_article) or else
					  (a_value = c_gumbo_tag_aside) or else
					  (a_value = c_gumbo_tag_h1) or else
					  (a_value = c_gumbo_tag_h2) or else
					  (a_value = c_gumbo_tag_h3) or else
					  (a_value = c_gumbo_tag_h4) or else
					  (a_value = c_gumbo_tag_h5) or else
					  (a_value = c_gumbo_tag_h6) or else
					  (a_value = c_gumbo_tag_hgroup) or else
					  (a_value = c_gumbo_tag_header) or else
					  (a_value = c_gumbo_tag_footer) or else
					  (a_value = c_gumbo_tag_address) or else
					  (a_value = c_gumbo_tag_p) or else
					  (a_value = c_gumbo_tag_hr) or else
					  (a_value = c_gumbo_tag_pre) or else
					  (a_value = c_gumbo_tag_blockquote) or else
					  (a_value = c_gumbo_tag_ol) or else
					  (a_value = c_gumbo_tag_ul) or else
					  (a_value = c_gumbo_tag_li) or else
					  (a_value = c_gumbo_tag_dl) or else
					  (a_value = c_gumbo_tag_dt) or else
					  (a_value = c_gumbo_tag_dd) or else
					  (a_value = c_gumbo_tag_figure) or else
					  (a_value = c_gumbo_tag_figcaption) or else
					  (a_value = c_gumbo_tag_div) or else
					  (a_value = c_gumbo_tag_a) or else
					  (a_value = c_gumbo_tag_em) or else
					  (a_value = c_gumbo_tag_strong) or else
					  (a_value = c_gumbo_tag_small) or else
					  (a_value = c_gumbo_tag_s) or else
					  (a_value = c_gumbo_tag_cite) or else
					  (a_value = c_gumbo_tag_q) or else
					  (a_value = c_gumbo_tag_dfn) or else
					  (a_value = c_gumbo_tag_abbr) or else
					  (a_value = c_gumbo_tag_time) or else
					  (a_value = c_gumbo_tag_code) or else
					  (a_value = c_gumbo_tag_var) or else
					  (a_value = c_gumbo_tag_samp) or else
					  (a_value = c_gumbo_tag_kbd) or else
					  (a_value = c_gumbo_tag_sub) or else
					  (a_value = c_gumbo_tag_sup) or else
					  (a_value = c_gumbo_tag_i) or else
					  (a_value = c_gumbo_tag_b) or else
					  (a_value = c_gumbo_tag_mark) or else
					  (a_value = c_gumbo_tag_ruby) or else
					  (a_value = c_gumbo_tag_rt) or else
					  (a_value = c_gumbo_tag_rp) or else
					  (a_value = c_gumbo_tag_bdi) or else
					  (a_value = c_gumbo_tag_bdo) or else
					  (a_value = c_gumbo_tag_span) or else
					  (a_value = c_gumbo_tag_br) or else
					  (a_value = c_gumbo_tag_wbr) or else
					  (a_value = c_gumbo_tag_ins) or else
					  (a_value = c_gumbo_tag_del) or else
					  (a_value = c_gumbo_tag_image) or else
					  (a_value = c_gumbo_tag_img) or else
					  (a_value = c_gumbo_tag_iframe) or else
					  (a_value = c_gumbo_tag_embed) or else
					  (a_value = c_gumbo_tag_object) or else
					  (a_value = c_gumbo_tag_param) or else
					  (a_value = c_gumbo_tag_video) or else
					  (a_value = c_gumbo_tag_audio) or else
					  (a_value = c_gumbo_tag_source) or else
					  (a_value = c_gumbo_tag_track) or else
					  (a_value = c_gumbo_tag_canvas) or else
					  (a_value = c_gumbo_tag_map) or else
					  (a_value = c_gumbo_tag_area) or else
					  (a_value = c_gumbo_tag_math) or else
					  (a_value = c_gumbo_tag_mi) or else
					  (a_value = c_gumbo_tag_mo) or else
					  (a_value = c_gumbo_tag_mn) or else
					  (a_value = c_gumbo_tag_ms) or else
					  (a_value = c_gumbo_tag_mtext) or else
					  (a_value = c_gumbo_tag_mglyph) or else
					  (a_value = c_gumbo_tag_malignmark) or else
					  (a_value = c_gumbo_tag_annotation_xml) or else
					  (a_value = c_gumbo_tag_svg) or else
					  (a_value = c_gumbo_tag_foreignobject) or else
					  (a_value = c_gumbo_tag_desc) or else
					  (a_value = c_gumbo_tag_table) or else
					  (a_value = c_gumbo_tag_caption) or else
					  (a_value = c_gumbo_tag_colgroup) or else
					  (a_value = c_gumbo_tag_col) or else
					  (a_value = c_gumbo_tag_tbody) or else
					  (a_value = c_gumbo_tag_thead) or else
					  (a_value = c_gumbo_tag_tfoot) or else
					  (a_value = c_gumbo_tag_tr) or else
					  (a_value = c_gumbo_tag_td) or else
					  (a_value = c_gumbo_tag_th) or else
					  (a_value = c_gumbo_tag_form) or else
					  (a_value = c_gumbo_tag_fieldset) or else
					  (a_value = c_gumbo_tag_legend) or else
					  (a_value = c_gumbo_tag_label) or else
					  (a_value = c_gumbo_tag_input) or else
					  (a_value = c_gumbo_tag_button) or else
					  (a_value = c_gumbo_tag_select) or else
					  (a_value = c_gumbo_tag_datalist) or else
					  (a_value = c_gumbo_tag_optgroup) or else
					  (a_value = c_gumbo_tag_option) or else
					  (a_value = c_gumbo_tag_textarea) or else
					  (a_value = c_gumbo_tag_keygen) or else
					  (a_value = c_gumbo_tag_output) or else
					  (a_value = c_gumbo_tag_progress) or else
					  (a_value = c_gumbo_tag_meter) or else
					  (a_value = c_gumbo_tag_details) or else
					  (a_value = c_gumbo_tag_summary) or else
--					  (a_value = c_gumbo_tag_command) or else
					  (a_value = c_gumbo_tag_menu) or else
					  (a_value = c_gumbo_tag_applet) or else
					  (a_value = c_gumbo_tag_acronym) or else
					  (a_value = c_gumbo_tag_bgsound) or else
					  (a_value = c_gumbo_tag_dir) or else
					  (a_value = c_gumbo_tag_frame) or else
					  (a_value = c_gumbo_tag_frameset) or else
					  (a_value = c_gumbo_tag_noframes) or else
					  (a_value = c_gumbo_tag_isindex) or else
					  (a_value = c_gumbo_tag_listing) or else
					  (a_value = c_gumbo_tag_xmp) or else
					  (a_value = c_gumbo_tag_nextid) or else
					  (a_value = c_gumbo_tag_noembed) or else
					  (a_value = c_gumbo_tag_plaintext) or else
					  (a_value = c_gumbo_tag_rb) or else
					  (a_value = c_gumbo_tag_strike) or else
					  (a_value = c_gumbo_tag_basefont) or else
					  (a_value = c_gumbo_tag_big) or else
					  (a_value = c_gumbo_tag_blink) or else
					  (a_value = c_gumbo_tag_center) or else
					  (a_value = c_gumbo_tag_font) or else
					  (a_value = c_gumbo_tag_marquee) or else
					  (a_value = c_gumbo_tag_multicol) or else
					  (a_value = c_gumbo_tag_nobr) or else
					  (a_value = c_gumbo_tag_spacer) or else
					  (a_value = c_gumbo_tag_tt) or else
					  (a_value = c_gumbo_tag_u) or else
					  (a_value = c_gumbo_tag_unknown) or else
					  (a_value = c_gumbo_tag_last)
		end


	gumbo_normalized_tagname: detachable STRING
			-- Normalized tag name
		local
			l_pointer: POINTER
			l_string : C_STRING
		do
			l_pointer := c_gumbo_normalized_tagname (value)
			if l_pointer /= default_pointer then
				create l_string.make_by_pointer (l_pointer)
				Result := l_string.string
			end
		end


	gumbo_tag_enum (a_tagname: STRING): like Current
		local
			l_cstring: C_STRING
		do
			create l_cstring.make (a_tagname)
			create Result.make_by_value (c_gumbo_tag_enum (l_cstring.item))
		end

feature {NONE} --C external

	c_gumbo_normalized_tagname (a_value: INTEGER): POINTER
			-- Returns the normalized (usually all-lowercased, except for foreign content)
			-- tag name for an GumboTag enum.  Return value is static data owned by the
			-- library.
			--
			--const char* gumbo_normalized_tagname(GumboTag tag);
		external
			"C inline use <gumbo.h>"
		alias
			"return gumbo_normalized_tagname((GumboTag)$a_value);"
		end


	c_gumbo_tag_enum (a_tagname: POINTER): INTEGER
			-- Converts a tag name string (which may be in upper or mixed case) to a tag
			-- enum
			-- GumboTag gumbo_tag_enum(const char* tagname);
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboTag) gumbo_tag_enum((const char*)$a_tagname);"
		end



feature {NONE} --Root Element

	c_gumbo_tag_html: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_HTML"
		end

feature {NONE} -- Document Metadata

	c_gumbo_tag_head: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_HEAD"
		end

	c_gumbo_tag_title: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TITLE"
		end

	c_gumbo_tag_base: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BASE"
		end

	c_gumbo_tag_link: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_LINK"
		end

	c_gumbo_tag_meta: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_META"
		end

	c_gumbo_tag_style: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_STYLE"
		end


feature {NONE} -- Scripting 1

	c_gumbo_tag_noscript: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_NOSCRIPT"
		end



feature {NONE} -- Sections

	c_gumbo_tag_body: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BODY"
		end

	c_gumbo_tag_section: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SECTION"
		end

	c_gumbo_tag_nav: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_NAV"
		end

	c_gumbo_tag_article: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_ARTICLE"
		end

	c_gumbo_tag_aside: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_ASIDE"
		end

	c_gumbo_tag_h1: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_H1"
		end

	c_gumbo_tag_h2: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_H2"
		end

	c_gumbo_tag_h3: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_H3"
		end

	c_gumbo_tag_h4: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_H4"
		end

	c_gumbo_tag_h5: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_H5"
		end

	c_gumbo_tag_h6: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_H6"
		end

	c_gumbo_tag_hgroup: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_HGROUP"
		end

	c_gumbo_tag_header: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_HEADER"
		end

	c_gumbo_tag_footer: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FOOTER"
		end

	c_gumbo_tag_address: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_ADDRESS"
		end

feature {NONE} -- Grouping content

	c_gumbo_tag_p: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_P"
		end

	c_gumbo_tag_hr: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_HR"
		end

	c_gumbo_tag_pre: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_PRE"
		end

	c_gumbo_tag_blockquote: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BLOCKQUOTE"
		end

	c_gumbo_tag_ol: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_OL"
		end

	c_gumbo_tag_ul: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_UL"
		end

	c_gumbo_tag_li: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_LI"
		end

	c_gumbo_tag_dl: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DL"
		end

	c_gumbo_tag_dt: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DT"
		end

	c_gumbo_tag_dd: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DD"
		end

	c_gumbo_tag_figure: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FIGURE"
		end

	c_gumbo_tag_figcaption: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FIGCAPTION"
		end

	c_gumbo_tag_div: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DIV"
		end

feature {NONE} -- Text level semantics

	c_gumbo_tag_a: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_A"
		end

	c_gumbo_tag_em: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_EM"
		end

	c_gumbo_tag_strong: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_STRONG"
		end

	c_gumbo_tag_small: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SMALL"
		end

	c_gumbo_tag_s: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_S"
		end

	c_gumbo_tag_cite: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_CITE"
		end

	c_gumbo_tag_q: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_Q"
		end

	c_gumbo_tag_dfn: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DFN"
		end

	c_gumbo_tag_abbr: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_ABBR"
		end

	c_gumbo_tag_time: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TIME"
		end

	c_gumbo_tag_code: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_CODE"
		end

	c_gumbo_tag_var: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_VAR"
		end

	c_gumbo_tag_samp: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SAMP"
		end

	c_gumbo_tag_kbd: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_KBD"
		end

	c_gumbo_tag_sub: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SUB"
		end

	c_gumbo_tag_sup: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SUP"
		end

	c_gumbo_tag_i: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_I"
		end

	c_gumbo_tag_b: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_B"
		end

	c_gumbo_tag_mark: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MARK"
		end

	c_gumbo_tag_ruby: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_RUBY"
		end

	c_gumbo_tag_rt: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_RT"
		end

	c_gumbo_tag_rp: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_RP"
		end

	c_gumbo_tag_bdi: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BDI"
		end

	c_gumbo_tag_bdo: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BDO"
		end

	c_GUMBO_TAG_SPAN: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SPAN"
		end

	c_gumbo_tag_br: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BR"
		end

	c_gumbo_tag_wbr: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_WBR"
		end

feature {NONE} --Edits

	c_gumbo_tag_ins: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_INS"
		end

	c_gumbo_tag_del: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DEL"
		end

feature {NONE}-- Embeded content 1

	c_gumbo_tag_image: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_IMAGE"
		end

	c_gumbo_tag_img: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_IMG"
		end

	c_gumbo_tag_iframe: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_IFRAME"
		end

	c_gumbo_tag_embed: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_EMBED"
		end

	c_gumbo_tag_object: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_OBJECT"
		end

	c_gumbo_tag_param: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_PARAM"
		end

	c_gumbo_tag_video: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_VIDEO"
		end

	c_gumbo_tag_audio: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_AUDIO"
		end

	c_gumbo_tag_source: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SOURCE"
		end

	c_gumbo_tag_track: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TRACK"
		end

	c_gumbo_tag_canvas: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_CANVAS"
		end

	c_gumbo_tag_map: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MAP"
		end

	c_gumbo_tag_area: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_AREA"
		end

feature {NONE} --Mahtml

	c_gumbo_tag_math: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MATH"
		end

	c_gumbo_tag_mi: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MI"
		end

	c_gumbo_tag_mo: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MO"
		end

	c_gumbo_tag_mn: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MN"
		end

	c_gumbo_tag_ms: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MS"
		end

	c_gumbo_tag_mtext: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MTEXT"
		end

	c_gumbo_tag_mglyph: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MGLYPH"
		end

	c_gumbo_tag_malignmark: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MALIGNMARK"
		end

	c_gumbo_tag_annotation_xml: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_ANNOTATION_XML"
		end

feature {NONE} --Svg

	c_gumbo_tag_svg: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SVG"
		end

	c_gumbo_tag_foreignobject: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FOREIGNOBJECT"
		end

	c_gumbo_tag_desc: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DESC"
		end

		-- // SVG title tags will have GUMBO_TAG_TITLE as with HTML.
feature {NONE} --Tabular data

	c_gumbo_tag_table: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TABLE"
		end

	c_gumbo_tag_caption: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_CAPTION"
		end

	c_gumbo_tag_colgroup: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_COLGROUP"
		end

	c_gumbo_tag_col: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_COL"
		end

	c_gumbo_tag_tbody: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TBODY"
		end

	c_gumbo_tag_thead: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_THEAD"
		end

	c_gumbo_tag_tfoot: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TFOOT"
		end

	c_gumbo_tag_tr: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TR"
		end

	c_gumbo_tag_td: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TD"
		end

	c_gumbo_tag_th: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TH"
		end

feature {NONE} --Forms

	c_gumbo_tag_form: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FORM"
		end

	c_gumbo_tag_fieldset: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FIELDSET"
		end

	c_gumbo_tag_legend: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_LEGEND"
		end

	c_gumbo_tag_label: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_LABEL"
		end

	c_gumbo_tag_input: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_INPUT"
		end

	c_gumbo_tag_button: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BUTTON"
		end

	c_gumbo_tag_select: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SELECT"
		end

	c_gumbo_tag_datalist: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DATALIST"
		end

	c_gumbo_tag_optgroup: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_OPTGROUP"
		end

	c_gumbo_tag_option: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_OPTION"
		end

	c_gumbo_tag_textarea: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TEXTAREA"
		end

	c_gumbo_tag_keygen: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_KEYGEN"
		end

	c_gumbo_tag_output: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_OUTPUT"
		end

	c_gumbo_tag_progress: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_PROGRESS"
		end

	c_gumbo_tag_meter: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_METER"
		end

feature {NONE} --Interactive elements

	c_gumbo_tag_details: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DETAILS"
		end

	c_gumbo_tag_summary: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SUMMARY"
		end

--	c_gumbo_tag_command: INTEGER
--		external
--			"C inline use <gumbo.h>"
--		alias
--			"return GUMBO_TAG_COMMAND"
--		end

	c_gumbo_tag_menu: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MENU"
		end

--  // Non-conforming elements that nonetheless appear in the HTML5 spec.
feature {NONE} --Non conforming features

	c_gumbo_tag_applet: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_APPLET"
		end

	c_gumbo_tag_acronym: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_ACRONYM"
		end

	c_gumbo_tag_bgsound: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BGSOUND"
		end

	c_gumbo_tag_dir: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_DIR"
		end

	c_gumbo_tag_frame: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FRAME"
		end

	c_gumbo_tag_frameset: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FRAMESET"
		end

	c_gumbo_tag_noframes: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_NOFRAMES"
		end

	c_gumbo_tag_isindex: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_ISINDEX"
		end

	c_gumbo_tag_listing: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_LISTING"
		end

	c_gumbo_tag_xmp: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_XMP"
		end

	c_gumbo_tag_nextid: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_NEXTID"
		end

	c_gumbo_tag_noembed: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_NOEMBED"
		end

	c_gumbo_tag_plaintext: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_PLAINTEXT"
		end

	c_gumbo_tag_rb: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_RB"
		end

	c_gumbo_tag_strike: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_STRIKE"
		end

	c_gumbo_tag_basefont: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BASEFONT"
		end

	c_gumbo_tag_big: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BIG"
		end

	c_gumbo_tag_blink: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_BLINK"
		end

	c_gumbo_tag_center: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_CENTER"
		end

	c_gumbo_tag_font: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_FONT"
		end

	c_gumbo_tag_marquee: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MARQUEE"
		end

	c_gumbo_tag_multicol: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_MULTICOL"
		end

	c_gumbo_tag_nobr: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_NOBR"
		end

	c_gumbo_tag_spacer: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_SPACER"
		end

	c_gumbo_tag_tt: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_TT"
		end

	c_gumbo_tag_u: INTEGER
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_U"
		end

feature {NONE} -- Implementation		

	c_gumbo_tag_unknown: INTEGER
			-- Used for all tags that don't have special handling in HTML.
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_UNKNOWN"
		end

	c_gumbo_tag_last: INTEGER
			-- A marker value to indicate the end of the enum, for iterating over it.
			-- Also used as the terminator for varargs functions that take tags.
		external
			"c inline use <gumbo.h>"
		alias
			"return GUMBO_TAG_LAST"
		end
end
