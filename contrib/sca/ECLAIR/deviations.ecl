# Project-specific configuration

-config=STD.arayzero,behavior={c18, "^.*gcc.*$", "specified"}
-config=STD.bitfldby,behavior={c18, "^.*gcc.*$", "specified"}
-config=STD.bitfldtp,behavior={c18, "^.*gcc.*$", "unsigned char;unsigned short"}
-config=STD.bytebits,behavior={c18, "^.*gcc.*$", "8"}
-config=STD.charsmap,behavior={c18, "^.*gcc.*$", "specified"}
-config=STD.charsmem,behavior={c18, "^.*gcc.*$", "utf8"}
-config=STD.charsobj,behavior={c18, "^.*gcc.*$", "utf8"}
-config=STD.charsval,behavior={c18, "^.*gcc.*$", "utf8"}
-config=STD.diagidnt,behavior={c18, "^.*gcc.*$", "specified"}
-config=STD.inclangl,behavior={c18, "^.*gcc.*$", "specified"}
-config=STD.stdtypes,behavior+={c18, "^.*gcc.*$", "__uint128_t"}
-config=STD.stmtexpr,behavior={c18, "^.*gcc.*$", "specified"}

-doc_begin="Accepted non-standard tokens."
-name_selector+={alignof, "^(__alignof__|__alignof)$"}
-name_selector+={asm, "^(__asm__|asm)$"}
-name_selector+={attribute, "^__attribute__$"}
-name_selector+={auto_type, "^__auto_type$"}
-name_selector+={builtin_offsetof, "^__builtin_offsetof$"}
-name_selector+={builtin_types_p, "^__builtin_types_compatible_p$"}
-name_selector+={builtin_va_arg, "^__builtin_va_arg$"}
-name_selector+={const, "^__const__$"}
-name_selector+={extension, "^__extension__$"}
-name_selector+={inline, "^(__inline__|__inline)$"}
-name_selector+={static_assert, "^_Static_assert$"}
-name_selector+={typeof, "^(__typeof__|typeof)$"}
-name_selector+={thread, "^(__thread)$"}
-name_selector+={volatile, "^__volatile__$"}

-config=STD.tokenext,behavior+={c18, "^.*gcc.*$",
"alignof||
asm||
attribute||
auto_type||
builtin_offsetof||
builtin_types_p||
builtin_va_arg||
const||
extension||
inline||
static_assert||
typeof||
thread||
volatile"
}
-doc_end

-doc_begin="Accept as language extensions the aforementioned language extensions."
-config=MC4.D1.2,behaviors+={deliberate,"service(STD.tokenext||STD.stmtexpr)"}

-doc="Depends on devising and encoding project-specific error handling strategies."
-disable=MC4.D4.7

-doc="The rule is disapplied."
-disable=MC4.R15.5

-doc="It is expected that some type definitions may be unused by this project configuration."
-reports+={deliberate, "service(MC4.R2.3)"}

-doc="It is expected that some macros may be unused by this project configuration."
-reports+={deliberate, "service(MC4.R2.5)"}

-doc="Recognize OE_bool as a boolean type."
-boolean_typenames+=OE_bool

-doc="in OE_scheduler_task_terminated initializes its second parameter."
-call_properties+={"name(OE_scheduler_task_terminated)", {"pointee_read(2=never)",
                                                          "pointee_write(2=always)",
							                              "taken()"}}

-doc="in OE_change_context_from_task_end does not use its first parameter."
-call_properties+={"name(OE_change_context_from_task_end)", {"pointee_read(1=never)"}}

-doc="HAL_GPIO_Init initializes its first parameter from a partially initialized second parameter."
-call_properties+={"name(HAL_GPIO_Init)", {"taken()"}}

-doc_begin="do-while-[01] is a well recognized loop idiom by the project."
-loop_idioms={do_stmt, "literal(0)||literal(1)"}
-doc_end

-doc_begin="while-[01] is a well recognized loop idiom by the project."
-loop_idioms+={while_stmt, "literal(0)||literal(1)"}
-doc_end

