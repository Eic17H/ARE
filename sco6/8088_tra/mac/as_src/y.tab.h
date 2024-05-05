#ifndef YYERRCODE
#define YYERRCODE 256
#endif

#define STRING 257
#define IDENT 258
#define FBSYM 259
#define CODE1 260
#define CODE2 261
#define CODE4 262
#define NUMBER0 263
#define NUMBER1 264
#define NUMBER2 265
#define NUMBER3 266
#define NUMBER 267
#define DOT 268
#define EXTERN 269
#define DATA 270
#define ASCII 271
#define SECTION 272
#define COMMON 273
#define BASE 274
#define SYMB 275
#define SYMD 276
#define ALIGN 277
#define ASSERT 278
#define SPACE 279
#define LINE 280
#define FILe 281
#define LIST 282
#define OP_EQ 283
#define OP_NE 284
#define OP_LE 285
#define OP_GE 286
#define OP_LL 287
#define OP_RR 288
#define OP_OO 289
#define OP_AA 290
#define R16 291
#define R8 292
#define RSEG 293
#define PREFIX 294
#define NOOP_1 295
#define NOOP_2 296
#define JOP 297
#define PUSHOP 298
#define IOOP 299
#define ADDOP 300
#define ROLOP 301
#define INCOP 302
#define NOTOP 303
#define CALLOP 304
#define CALFOP 305
#define LEAOP 306
#define ARPLOP 307
#define ESC 308
#define INT 309
#define RET 310
#define XCHG 311
#define TEST 312
#define MOV 313
#define IMUL 314
#define ENTER 315
#define EXTOP 316
#define EXTOP1 317
#define ST 318
typedef union {
	short			y_word;
	long	y_valu;
	expr_t	y_expr;
	item_t	*y_item;

} YYSTYPE;
extern YYSTYPE yylval;
