
obj/p-test.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main>:
extern uint8_t end[];

uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main(void) {
  100000:	55                   	push   %rbp
  100001:	48 89 e5             	mov    %rsp,%rbp

// sys_getpid
//    Return current process ID.
static inline pid_t sys_getpid(void) {
    pid_t result;
    asm volatile ("int %1" : "=a" (result)
  100004:	cd 31                	int    $0x31
  100006:	89 c7                	mov    %eax,%edi
    pid_t p = sys_getpid();
    srand(p);
  100008:	e8 5c 02 00 00       	callq  100269 <srand>
    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = ROUNDUP((uint8_t*) end, PAGESIZE);
  10000d:	b8 17 20 10 00       	mov    $0x102017,%eax
  100012:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  100018:	48 89 05 e9 0f 00 00 	mov    %rax,0xfe9(%rip)        # 101008 <heap_top>
//    Allocate a page of memory at address `addr` and allow process to
//    write to it. `Addr` must be page-aligned (i.e., a multiple of
//    PAGESIZE == 4096). Returns 0 on success and -1 on failure.
static inline int sys_page_alloc(void* addr) {
    int result;
    asm volatile ("int %1" : "=a" (result)
  10001f:	bf 28 10 10 00       	mov    $0x101028,%edi
  100024:	cd 33                	int    $0x33

    // Test for alignment
    int x = sys_page_alloc((void *) (end + 0x10));
    if(x != -1){
  100026:	83 f8 ff             	cmp    $0xffffffff,%eax
  100029:	75 1b                	jne    100046 <process_main+0x46>
  10002b:	bf 00 10 30 00       	mov    $0x301000,%edi
  100030:	cd 33                	int    $0x33
        panic("Error, sys_page_alloc doesn't check for alignment!");
    }
    // Test for accessing beyond size limits
    x = sys_page_alloc((void *) MEMSIZE_VIRTUAL + PAGESIZE);
    if(x != -1){
  100032:	83 f8 ff             	cmp    $0xffffffff,%eax
  100035:	74 1e                	je     100055 <process_main+0x55>
        panic("Error, sys_page_alloc doesn't check for VM bounds!");
  100037:	bf 48 0c 10 00       	mov    $0x100c48,%edi
  10003c:	b8 00 00 00 00       	mov    $0x0,%eax
  100041:	e8 bf 0a 00 00       	callq  100b05 <panic>
        panic("Error, sys_page_alloc doesn't check for alignment!");
  100046:	bf 10 0c 10 00       	mov    $0x100c10,%edi
  10004b:	b8 00 00 00 00       	mov    $0x0,%eax
  100050:	e8 b0 0a 00 00       	callq  100b05 <panic>
    }

    TEST_PASS();
  100055:	bf 7b 0c 10 00       	mov    $0x100c7b,%edi
  10005a:	b8 00 00 00 00       	mov    $0x0,%eax
  10005f:	e8 a1 0a 00 00       	callq  100b05 <panic>

0000000000100064 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
  100064:	48 89 f9             	mov    %rdi,%rcx
  100067:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100069:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
  100070:	00 
  100071:	72 08                	jb     10007b <console_putc+0x17>
        cp->cursor = console;
  100073:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
  10007a:	00 
    }
    if (c == '\n') {
  10007b:	40 80 fe 0a          	cmp    $0xa,%sil
  10007f:	74 16                	je     100097 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
  100081:	48 8b 41 08          	mov    0x8(%rcx),%rax
  100085:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100089:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  10008d:	40 0f b6 f6          	movzbl %sil,%esi
  100091:	09 fe                	or     %edi,%esi
  100093:	66 89 30             	mov    %si,(%rax)
    }
}
  100096:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
  100097:	4c 8b 41 08          	mov    0x8(%rcx),%r8
  10009b:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
  1000a2:	4c 89 c6             	mov    %r8,%rsi
  1000a5:	48 d1 fe             	sar    %rsi
  1000a8:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  1000af:	66 66 66 
  1000b2:	48 89 f0             	mov    %rsi,%rax
  1000b5:	48 f7 ea             	imul   %rdx
  1000b8:	48 c1 fa 05          	sar    $0x5,%rdx
  1000bc:	49 c1 f8 3f          	sar    $0x3f,%r8
  1000c0:	4c 29 c2             	sub    %r8,%rdx
  1000c3:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  1000c7:	48 c1 e2 04          	shl    $0x4,%rdx
  1000cb:	89 f0                	mov    %esi,%eax
  1000cd:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
  1000cf:	83 cf 20             	or     $0x20,%edi
  1000d2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1000d6:	48 8d 72 02          	lea    0x2(%rdx),%rsi
  1000da:	48 89 71 08          	mov    %rsi,0x8(%rcx)
  1000de:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
  1000e1:	83 c0 01             	add    $0x1,%eax
  1000e4:	83 f8 50             	cmp    $0x50,%eax
  1000e7:	75 e9                	jne    1000d2 <console_putc+0x6e>
  1000e9:	c3                   	retq   

00000000001000ea <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
  1000ea:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1000ee:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1000f2:	73 0b                	jae    1000ff <string_putc+0x15>
        *sp->s++ = c;
  1000f4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1000f8:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1000fc:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
  1000ff:	c3                   	retq   

0000000000100100 <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
  100100:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  100103:	48 85 d2             	test   %rdx,%rdx
  100106:	74 17                	je     10011f <memcpy+0x1f>
  100108:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
  10010d:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
  100112:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  100116:	48 83 c1 01          	add    $0x1,%rcx
  10011a:	48 39 d1             	cmp    %rdx,%rcx
  10011d:	75 ee                	jne    10010d <memcpy+0xd>
}
  10011f:	c3                   	retq   

0000000000100120 <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
  100120:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
  100123:	48 39 fe             	cmp    %rdi,%rsi
  100126:	72 1d                	jb     100145 <memmove+0x25>
        while (n-- > 0) {
  100128:	b9 00 00 00 00       	mov    $0x0,%ecx
  10012d:	48 85 d2             	test   %rdx,%rdx
  100130:	74 12                	je     100144 <memmove+0x24>
            *d++ = *s++;
  100132:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  100136:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  10013a:	48 83 c1 01          	add    $0x1,%rcx
  10013e:	48 39 ca             	cmp    %rcx,%rdx
  100141:	75 ef                	jne    100132 <memmove+0x12>
}
  100143:	c3                   	retq   
  100144:	c3                   	retq   
    if (s < d && s + n > d) {
  100145:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  100149:	48 39 cf             	cmp    %rcx,%rdi
  10014c:	73 da                	jae    100128 <memmove+0x8>
        while (n-- > 0) {
  10014e:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  100152:	48 85 d2             	test   %rdx,%rdx
  100155:	74 ec                	je     100143 <memmove+0x23>
            *--d = *--s;
  100157:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  10015b:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  10015e:	48 83 e9 01          	sub    $0x1,%rcx
  100162:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  100166:	75 ef                	jne    100157 <memmove+0x37>
  100168:	c3                   	retq   

0000000000100169 <memset>:
void* memset(void* v, int c, size_t n) {
  100169:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  10016c:	48 85 d2             	test   %rdx,%rdx
  10016f:	74 12                	je     100183 <memset+0x1a>
  100171:	48 01 fa             	add    %rdi,%rdx
  100174:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
  100177:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  10017a:	48 83 c1 01          	add    $0x1,%rcx
  10017e:	48 39 ca             	cmp    %rcx,%rdx
  100181:	75 f4                	jne    100177 <memset+0xe>
}
  100183:	c3                   	retq   

0000000000100184 <strlen>:
    for (n = 0; *s != '\0'; ++s) {
  100184:	80 3f 00             	cmpb   $0x0,(%rdi)
  100187:	74 10                	je     100199 <strlen+0x15>
  100189:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  10018e:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100192:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100196:	75 f6                	jne    10018e <strlen+0xa>
  100198:	c3                   	retq   
  100199:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10019e:	c3                   	retq   

000000000010019f <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  10019f:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1001a2:	ba 00 00 00 00       	mov    $0x0,%edx
  1001a7:	48 85 f6             	test   %rsi,%rsi
  1001aa:	74 11                	je     1001bd <strnlen+0x1e>
  1001ac:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1001b0:	74 0c                	je     1001be <strnlen+0x1f>
        ++n;
  1001b2:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1001b6:	48 39 d0             	cmp    %rdx,%rax
  1001b9:	75 f1                	jne    1001ac <strnlen+0xd>
  1001bb:	eb 04                	jmp    1001c1 <strnlen+0x22>
  1001bd:	c3                   	retq   
  1001be:	48 89 d0             	mov    %rdx,%rax
}
  1001c1:	c3                   	retq   

00000000001001c2 <strcpy>:
char* strcpy(char* dst, const char* src) {
  1001c2:	48 89 f8             	mov    %rdi,%rax
  1001c5:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
  1001ca:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
  1001ce:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
  1001d1:	48 83 c2 01          	add    $0x1,%rdx
  1001d5:	84 c9                	test   %cl,%cl
  1001d7:	75 f1                	jne    1001ca <strcpy+0x8>
}
  1001d9:	c3                   	retq   

00000000001001da <strcmp>:
    while (*a && *b && *a == *b) {
  1001da:	0f b6 07             	movzbl (%rdi),%eax
  1001dd:	84 c0                	test   %al,%al
  1001df:	74 1a                	je     1001fb <strcmp+0x21>
  1001e1:	0f b6 16             	movzbl (%rsi),%edx
  1001e4:	38 c2                	cmp    %al,%dl
  1001e6:	75 13                	jne    1001fb <strcmp+0x21>
  1001e8:	84 d2                	test   %dl,%dl
  1001ea:	74 0f                	je     1001fb <strcmp+0x21>
        ++a, ++b;
  1001ec:	48 83 c7 01          	add    $0x1,%rdi
  1001f0:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
  1001f4:	0f b6 07             	movzbl (%rdi),%eax
  1001f7:	84 c0                	test   %al,%al
  1001f9:	75 e6                	jne    1001e1 <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
  1001fb:	3a 06                	cmp    (%rsi),%al
  1001fd:	0f 97 c0             	seta   %al
  100200:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
  100203:	83 d8 00             	sbb    $0x0,%eax
}
  100206:	c3                   	retq   

0000000000100207 <strchr>:
    while (*s && *s != (char) c) {
  100207:	0f b6 07             	movzbl (%rdi),%eax
  10020a:	84 c0                	test   %al,%al
  10020c:	74 10                	je     10021e <strchr+0x17>
  10020e:	40 38 f0             	cmp    %sil,%al
  100211:	74 18                	je     10022b <strchr+0x24>
        ++s;
  100213:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  100217:	0f b6 07             	movzbl (%rdi),%eax
  10021a:	84 c0                	test   %al,%al
  10021c:	75 f0                	jne    10020e <strchr+0x7>
        return NULL;
  10021e:	40 84 f6             	test   %sil,%sil
  100221:	b8 00 00 00 00       	mov    $0x0,%eax
  100226:	48 0f 44 c7          	cmove  %rdi,%rax
}
  10022a:	c3                   	retq   
  10022b:	48 89 f8             	mov    %rdi,%rax
  10022e:	c3                   	retq   

000000000010022f <rand>:
    if (!rand_seed_set) {
  10022f:	83 3d de 0d 00 00 00 	cmpl   $0x0,0xdde(%rip)        # 101014 <rand_seed_set>
  100236:	74 1b                	je     100253 <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
  100238:	69 05 ce 0d 00 00 0d 	imul   $0x19660d,0xdce(%rip),%eax        # 101010 <rand_seed>
  10023f:	66 19 00 
  100242:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  100247:	89 05 c3 0d 00 00    	mov    %eax,0xdc3(%rip)        # 101010 <rand_seed>
    return rand_seed & RAND_MAX;
  10024d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  100252:	c3                   	retq   
    rand_seed = seed;
  100253:	c7 05 b3 0d 00 00 9e 	movl   $0x30d4879e,0xdb3(%rip)        # 101010 <rand_seed>
  10025a:	87 d4 30 
    rand_seed_set = 1;
  10025d:	c7 05 ad 0d 00 00 01 	movl   $0x1,0xdad(%rip)        # 101014 <rand_seed_set>
  100264:	00 00 00 
}
  100267:	eb cf                	jmp    100238 <rand+0x9>

0000000000100269 <srand>:
    rand_seed = seed;
  100269:	89 3d a1 0d 00 00    	mov    %edi,0xda1(%rip)        # 101010 <rand_seed>
    rand_seed_set = 1;
  10026f:	c7 05 9b 0d 00 00 01 	movl   $0x1,0xd9b(%rip)        # 101014 <rand_seed_set>
  100276:	00 00 00 
}
  100279:	c3                   	retq   

000000000010027a <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
  10027a:	55                   	push   %rbp
  10027b:	48 89 e5             	mov    %rsp,%rbp
  10027e:	41 57                	push   %r15
  100280:	41 56                	push   %r14
  100282:	41 55                	push   %r13
  100284:	41 54                	push   %r12
  100286:	53                   	push   %rbx
  100287:	48 83 ec 58          	sub    $0x58,%rsp
  10028b:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  10028f:	0f b6 02             	movzbl (%rdx),%eax
  100292:	84 c0                	test   %al,%al
  100294:	0f 84 b0 06 00 00    	je     10094a <printer_vprintf+0x6d0>
  10029a:	49 89 fe             	mov    %rdi,%r14
  10029d:	49 89 d4             	mov    %rdx,%r12
            length = 1;
  1002a0:	41 89 f7             	mov    %esi,%r15d
  1002a3:	e9 a4 04 00 00       	jmpq   10074c <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
  1002a8:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1002ad:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1002b3:	45 84 e4             	test   %r12b,%r12b
  1002b6:	0f 84 82 06 00 00    	je     10093e <printer_vprintf+0x6c4>
        int flags = 0;
  1002bc:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  1002c2:	41 0f be f4          	movsbl %r12b,%esi
  1002c6:	bf 91 0e 10 00       	mov    $0x100e91,%edi
  1002cb:	e8 37 ff ff ff       	callq  100207 <strchr>
  1002d0:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1002d3:	48 85 c0             	test   %rax,%rax
  1002d6:	74 55                	je     10032d <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
  1002d8:	48 81 e9 91 0e 10 00 	sub    $0x100e91,%rcx
  1002df:	b8 01 00 00 00       	mov    $0x1,%eax
  1002e4:	d3 e0                	shl    %cl,%eax
  1002e6:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1002e9:	48 83 c3 01          	add    $0x1,%rbx
  1002ed:	44 0f b6 23          	movzbl (%rbx),%r12d
  1002f1:	45 84 e4             	test   %r12b,%r12b
  1002f4:	75 cc                	jne    1002c2 <printer_vprintf+0x48>
  1002f6:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
  1002fa:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  100300:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
  100307:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  10030a:	0f 84 a9 00 00 00    	je     1003b9 <printer_vprintf+0x13f>
        int length = 0;
  100310:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
  100315:	0f b6 13             	movzbl (%rbx),%edx
  100318:	8d 42 bd             	lea    -0x43(%rdx),%eax
  10031b:	3c 37                	cmp    $0x37,%al
  10031d:	0f 87 c4 04 00 00    	ja     1007e7 <printer_vprintf+0x56d>
  100323:	0f b6 c0             	movzbl %al,%eax
  100326:	ff 24 c5 a0 0c 10 00 	jmpq   *0x100ca0(,%rax,8)
        if (*format >= '1' && *format <= '9') {
  10032d:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
  100331:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  100336:	3c 08                	cmp    $0x8,%al
  100338:	77 2f                	ja     100369 <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10033a:	0f b6 03             	movzbl (%rbx),%eax
  10033d:	8d 50 d0             	lea    -0x30(%rax),%edx
  100340:	80 fa 09             	cmp    $0x9,%dl
  100343:	77 5e                	ja     1003a3 <printer_vprintf+0x129>
  100345:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  10034b:	48 83 c3 01          	add    $0x1,%rbx
  10034f:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  100354:	0f be c0             	movsbl %al,%eax
  100357:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10035c:	0f b6 03             	movzbl (%rbx),%eax
  10035f:	8d 50 d0             	lea    -0x30(%rax),%edx
  100362:	80 fa 09             	cmp    $0x9,%dl
  100365:	76 e4                	jbe    10034b <printer_vprintf+0xd1>
  100367:	eb 97                	jmp    100300 <printer_vprintf+0x86>
        } else if (*format == '*') {
  100369:	41 80 fc 2a          	cmp    $0x2a,%r12b
  10036d:	75 3f                	jne    1003ae <printer_vprintf+0x134>
            width = va_arg(val, int);
  10036f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100373:	8b 07                	mov    (%rdi),%eax
  100375:	83 f8 2f             	cmp    $0x2f,%eax
  100378:	77 17                	ja     100391 <printer_vprintf+0x117>
  10037a:	89 c2                	mov    %eax,%edx
  10037c:	48 03 57 10          	add    0x10(%rdi),%rdx
  100380:	83 c0 08             	add    $0x8,%eax
  100383:	89 07                	mov    %eax,(%rdi)
  100385:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  100388:	48 83 c3 01          	add    $0x1,%rbx
  10038c:	e9 6f ff ff ff       	jmpq   100300 <printer_vprintf+0x86>
            width = va_arg(val, int);
  100391:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100395:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100399:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10039d:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1003a1:	eb e2                	jmp    100385 <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1003a3:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1003a9:	e9 52 ff ff ff       	jmpq   100300 <printer_vprintf+0x86>
        int width = -1;
  1003ae:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1003b4:	e9 47 ff ff ff       	jmpq   100300 <printer_vprintf+0x86>
            ++format;
  1003b9:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1003bd:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1003c1:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1003c4:	80 f9 09             	cmp    $0x9,%cl
  1003c7:	76 13                	jbe    1003dc <printer_vprintf+0x162>
            } else if (*format == '*') {
  1003c9:	3c 2a                	cmp    $0x2a,%al
  1003cb:	74 33                	je     100400 <printer_vprintf+0x186>
            ++format;
  1003cd:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1003d0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
  1003d7:	e9 34 ff ff ff       	jmpq   100310 <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003dc:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1003e1:	48 83 c2 01          	add    $0x1,%rdx
  1003e5:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1003e8:	0f be c0             	movsbl %al,%eax
  1003eb:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003ef:	0f b6 02             	movzbl (%rdx),%eax
  1003f2:	8d 70 d0             	lea    -0x30(%rax),%esi
  1003f5:	40 80 fe 09          	cmp    $0x9,%sil
  1003f9:	76 e6                	jbe    1003e1 <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
  1003fb:	48 89 d3             	mov    %rdx,%rbx
  1003fe:	eb 1c                	jmp    10041c <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
  100400:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100404:	8b 07                	mov    (%rdi),%eax
  100406:	83 f8 2f             	cmp    $0x2f,%eax
  100409:	77 23                	ja     10042e <printer_vprintf+0x1b4>
  10040b:	89 c2                	mov    %eax,%edx
  10040d:	48 03 57 10          	add    0x10(%rdi),%rdx
  100411:	83 c0 08             	add    $0x8,%eax
  100414:	89 07                	mov    %eax,(%rdi)
  100416:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  100418:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  10041c:	85 c9                	test   %ecx,%ecx
  10041e:	b8 00 00 00 00       	mov    $0x0,%eax
  100423:	0f 49 c1             	cmovns %ecx,%eax
  100426:	89 45 9c             	mov    %eax,-0x64(%rbp)
  100429:	e9 e2 fe ff ff       	jmpq   100310 <printer_vprintf+0x96>
                precision = va_arg(val, int);
  10042e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100432:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100436:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10043a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10043e:	eb d6                	jmp    100416 <printer_vprintf+0x19c>
        switch (*format) {
  100440:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  100445:	e9 f3 00 00 00       	jmpq   10053d <printer_vprintf+0x2c3>
            ++format;
  10044a:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
  10044e:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
  100453:	e9 bd fe ff ff       	jmpq   100315 <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100458:	85 c9                	test   %ecx,%ecx
  10045a:	74 55                	je     1004b1 <printer_vprintf+0x237>
  10045c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100460:	8b 07                	mov    (%rdi),%eax
  100462:	83 f8 2f             	cmp    $0x2f,%eax
  100465:	77 38                	ja     10049f <printer_vprintf+0x225>
  100467:	89 c2                	mov    %eax,%edx
  100469:	48 03 57 10          	add    0x10(%rdi),%rdx
  10046d:	83 c0 08             	add    $0x8,%eax
  100470:	89 07                	mov    %eax,(%rdi)
  100472:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  100475:	48 89 d0             	mov    %rdx,%rax
  100478:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  10047c:	49 89 d0             	mov    %rdx,%r8
  10047f:	49 f7 d8             	neg    %r8
  100482:	25 80 00 00 00       	and    $0x80,%eax
  100487:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  10048b:	0b 45 a8             	or     -0x58(%rbp),%eax
  10048e:	83 c8 60             	or     $0x60,%eax
  100491:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
  100494:	41 bc a0 0e 10 00    	mov    $0x100ea0,%r12d
            break;
  10049a:	e9 35 01 00 00       	jmpq   1005d4 <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10049f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004a3:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1004a7:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004ab:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1004af:	eb c1                	jmp    100472 <printer_vprintf+0x1f8>
  1004b1:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004b5:	8b 07                	mov    (%rdi),%eax
  1004b7:	83 f8 2f             	cmp    $0x2f,%eax
  1004ba:	77 10                	ja     1004cc <printer_vprintf+0x252>
  1004bc:	89 c2                	mov    %eax,%edx
  1004be:	48 03 57 10          	add    0x10(%rdi),%rdx
  1004c2:	83 c0 08             	add    $0x8,%eax
  1004c5:	89 07                	mov    %eax,(%rdi)
  1004c7:	48 63 12             	movslq (%rdx),%rdx
  1004ca:	eb a9                	jmp    100475 <printer_vprintf+0x1fb>
  1004cc:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004d0:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1004d4:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004d8:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1004dc:	eb e9                	jmp    1004c7 <printer_vprintf+0x24d>
        int base = 10;
  1004de:	be 0a 00 00 00       	mov    $0xa,%esi
  1004e3:	eb 58                	jmp    10053d <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1004e5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004e9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1004ed:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004f1:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1004f5:	eb 60                	jmp    100557 <printer_vprintf+0x2dd>
  1004f7:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004fb:	8b 07                	mov    (%rdi),%eax
  1004fd:	83 f8 2f             	cmp    $0x2f,%eax
  100500:	77 10                	ja     100512 <printer_vprintf+0x298>
  100502:	89 c2                	mov    %eax,%edx
  100504:	48 03 57 10          	add    0x10(%rdi),%rdx
  100508:	83 c0 08             	add    $0x8,%eax
  10050b:	89 07                	mov    %eax,(%rdi)
  10050d:	44 8b 02             	mov    (%rdx),%r8d
  100510:	eb 48                	jmp    10055a <printer_vprintf+0x2e0>
  100512:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100516:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10051a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10051e:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100522:	eb e9                	jmp    10050d <printer_vprintf+0x293>
  100524:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  100527:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
  10052e:	bf 80 0e 10 00       	mov    $0x100e80,%edi
  100533:	e9 e2 02 00 00       	jmpq   10081a <printer_vprintf+0x5a0>
            base = 16;
  100538:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  10053d:	85 c9                	test   %ecx,%ecx
  10053f:	74 b6                	je     1004f7 <printer_vprintf+0x27d>
  100541:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100545:	8b 01                	mov    (%rcx),%eax
  100547:	83 f8 2f             	cmp    $0x2f,%eax
  10054a:	77 99                	ja     1004e5 <printer_vprintf+0x26b>
  10054c:	89 c2                	mov    %eax,%edx
  10054e:	48 03 51 10          	add    0x10(%rcx),%rdx
  100552:	83 c0 08             	add    $0x8,%eax
  100555:	89 01                	mov    %eax,(%rcx)
  100557:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  10055a:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
  10055e:	85 f6                	test   %esi,%esi
  100560:	79 c2                	jns    100524 <printer_vprintf+0x2aa>
        base = -base;
  100562:	41 89 f1             	mov    %esi,%r9d
  100565:	f7 de                	neg    %esi
  100567:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
  10056e:	bf 60 0e 10 00       	mov    $0x100e60,%edi
  100573:	e9 a2 02 00 00       	jmpq   10081a <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
  100578:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10057c:	8b 07                	mov    (%rdi),%eax
  10057e:	83 f8 2f             	cmp    $0x2f,%eax
  100581:	77 1c                	ja     10059f <printer_vprintf+0x325>
  100583:	89 c2                	mov    %eax,%edx
  100585:	48 03 57 10          	add    0x10(%rdi),%rdx
  100589:	83 c0 08             	add    $0x8,%eax
  10058c:	89 07                	mov    %eax,(%rdi)
  10058e:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  100591:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
  100598:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  10059d:	eb c3                	jmp    100562 <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
  10059f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005a3:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1005a7:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005ab:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1005af:	eb dd                	jmp    10058e <printer_vprintf+0x314>
            data = va_arg(val, char*);
  1005b1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005b5:	8b 01                	mov    (%rcx),%eax
  1005b7:	83 f8 2f             	cmp    $0x2f,%eax
  1005ba:	0f 87 a5 01 00 00    	ja     100765 <printer_vprintf+0x4eb>
  1005c0:	89 c2                	mov    %eax,%edx
  1005c2:	48 03 51 10          	add    0x10(%rcx),%rdx
  1005c6:	83 c0 08             	add    $0x8,%eax
  1005c9:	89 01                	mov    %eax,(%rcx)
  1005cb:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  1005ce:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
  1005d4:	8b 45 a8             	mov    -0x58(%rbp),%eax
  1005d7:	83 e0 20             	and    $0x20,%eax
  1005da:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1005dd:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1005e3:	0f 85 21 02 00 00    	jne    10080a <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1005e9:	8b 45 a8             	mov    -0x58(%rbp),%eax
  1005ec:	89 45 88             	mov    %eax,-0x78(%rbp)
  1005ef:	83 e0 60             	and    $0x60,%eax
  1005f2:	83 f8 60             	cmp    $0x60,%eax
  1005f5:	0f 84 54 02 00 00    	je     10084f <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1005fb:	8b 45 a8             	mov    -0x58(%rbp),%eax
  1005fe:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  100601:	48 c7 45 a0 a0 0e 10 	movq   $0x100ea0,-0x60(%rbp)
  100608:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100609:	83 f8 21             	cmp    $0x21,%eax
  10060c:	0f 84 79 02 00 00    	je     10088b <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100612:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100615:	89 f8                	mov    %edi,%eax
  100617:	f7 d0                	not    %eax
  100619:	c1 e8 1f             	shr    $0x1f,%eax
  10061c:	89 45 84             	mov    %eax,-0x7c(%rbp)
  10061f:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
  100623:	0f 85 9e 02 00 00    	jne    1008c7 <printer_vprintf+0x64d>
  100629:	84 c0                	test   %al,%al
  10062b:	0f 84 96 02 00 00    	je     1008c7 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
  100631:	48 63 f7             	movslq %edi,%rsi
  100634:	4c 89 e7             	mov    %r12,%rdi
  100637:	e8 63 fb ff ff       	callq  10019f <strnlen>
  10063c:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  10063f:	8b 45 88             	mov    -0x78(%rbp),%eax
  100642:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
  100645:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
  10064c:	83 f8 22             	cmp    $0x22,%eax
  10064f:	0f 84 aa 02 00 00    	je     1008ff <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
  100655:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  100659:	e8 26 fb ff ff       	callq  100184 <strlen>
  10065e:	8b 55 9c             	mov    -0x64(%rbp),%edx
  100661:	03 55 98             	add    -0x68(%rbp),%edx
  100664:	44 89 e9             	mov    %r13d,%ecx
  100667:	29 d1                	sub    %edx,%ecx
  100669:	29 c1                	sub    %eax,%ecx
  10066b:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
  10066e:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100671:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
  100675:	75 2d                	jne    1006a4 <printer_vprintf+0x42a>
  100677:	85 c9                	test   %ecx,%ecx
  100679:	7e 29                	jle    1006a4 <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
  10067b:	44 89 fa             	mov    %r15d,%edx
  10067e:	be 20 00 00 00       	mov    $0x20,%esi
  100683:	4c 89 f7             	mov    %r14,%rdi
  100686:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100689:	41 83 ed 01          	sub    $0x1,%r13d
  10068d:	45 85 ed             	test   %r13d,%r13d
  100690:	7f e9                	jg     10067b <printer_vprintf+0x401>
  100692:	8b 7d 8c             	mov    -0x74(%rbp),%edi
  100695:	85 ff                	test   %edi,%edi
  100697:	b8 01 00 00 00       	mov    $0x1,%eax
  10069c:	0f 4f c7             	cmovg  %edi,%eax
  10069f:	29 c7                	sub    %eax,%edi
  1006a1:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  1006a4:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  1006a8:	0f b6 07             	movzbl (%rdi),%eax
  1006ab:	84 c0                	test   %al,%al
  1006ad:	74 22                	je     1006d1 <printer_vprintf+0x457>
  1006af:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006b3:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
  1006b6:	0f b6 f0             	movzbl %al,%esi
  1006b9:	44 89 fa             	mov    %r15d,%edx
  1006bc:	4c 89 f7             	mov    %r14,%rdi
  1006bf:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
  1006c2:	48 83 c3 01          	add    $0x1,%rbx
  1006c6:	0f b6 03             	movzbl (%rbx),%eax
  1006c9:	84 c0                	test   %al,%al
  1006cb:	75 e9                	jne    1006b6 <printer_vprintf+0x43c>
  1006cd:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
  1006d1:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1006d4:	85 c0                	test   %eax,%eax
  1006d6:	7e 1d                	jle    1006f5 <printer_vprintf+0x47b>
  1006d8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006dc:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
  1006de:	44 89 fa             	mov    %r15d,%edx
  1006e1:	be 30 00 00 00       	mov    $0x30,%esi
  1006e6:	4c 89 f7             	mov    %r14,%rdi
  1006e9:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
  1006ec:	83 eb 01             	sub    $0x1,%ebx
  1006ef:	75 ed                	jne    1006de <printer_vprintf+0x464>
  1006f1:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
  1006f5:	8b 45 98             	mov    -0x68(%rbp),%eax
  1006f8:	85 c0                	test   %eax,%eax
  1006fa:	7e 27                	jle    100723 <printer_vprintf+0x4a9>
  1006fc:	89 c0                	mov    %eax,%eax
  1006fe:	4c 01 e0             	add    %r12,%rax
  100701:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100705:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
  100708:	41 0f b6 34 24       	movzbl (%r12),%esi
  10070d:	44 89 fa             	mov    %r15d,%edx
  100710:	4c 89 f7             	mov    %r14,%rdi
  100713:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
  100716:	49 83 c4 01          	add    $0x1,%r12
  10071a:	49 39 dc             	cmp    %rbx,%r12
  10071d:	75 e9                	jne    100708 <printer_vprintf+0x48e>
  10071f:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
  100723:	45 85 ed             	test   %r13d,%r13d
  100726:	7e 14                	jle    10073c <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
  100728:	44 89 fa             	mov    %r15d,%edx
  10072b:	be 20 00 00 00       	mov    $0x20,%esi
  100730:	4c 89 f7             	mov    %r14,%rdi
  100733:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
  100736:	41 83 ed 01          	sub    $0x1,%r13d
  10073a:	75 ec                	jne    100728 <printer_vprintf+0x4ae>
    for (; *format; ++format) {
  10073c:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  100740:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100744:	84 c0                	test   %al,%al
  100746:	0f 84 fe 01 00 00    	je     10094a <printer_vprintf+0x6d0>
        if (*format != '%') {
  10074c:	3c 25                	cmp    $0x25,%al
  10074e:	0f 84 54 fb ff ff    	je     1002a8 <printer_vprintf+0x2e>
            p->putc(p, *format, color);
  100754:	0f b6 f0             	movzbl %al,%esi
  100757:	44 89 fa             	mov    %r15d,%edx
  10075a:	4c 89 f7             	mov    %r14,%rdi
  10075d:	41 ff 16             	callq  *(%r14)
            continue;
  100760:	4c 89 e3             	mov    %r12,%rbx
  100763:	eb d7                	jmp    10073c <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
  100765:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100769:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10076d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100771:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100775:	e9 51 fe ff ff       	jmpq   1005cb <printer_vprintf+0x351>
            color = va_arg(val, int);
  10077a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10077e:	8b 07                	mov    (%rdi),%eax
  100780:	83 f8 2f             	cmp    $0x2f,%eax
  100783:	77 10                	ja     100795 <printer_vprintf+0x51b>
  100785:	89 c2                	mov    %eax,%edx
  100787:	48 03 57 10          	add    0x10(%rdi),%rdx
  10078b:	83 c0 08             	add    $0x8,%eax
  10078e:	89 07                	mov    %eax,(%rdi)
  100790:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
  100793:	eb a7                	jmp    10073c <printer_vprintf+0x4c2>
            color = va_arg(val, int);
  100795:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100799:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10079d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007a1:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007a5:	eb e9                	jmp    100790 <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
  1007a7:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007ab:	8b 01                	mov    (%rcx),%eax
  1007ad:	83 f8 2f             	cmp    $0x2f,%eax
  1007b0:	77 23                	ja     1007d5 <printer_vprintf+0x55b>
  1007b2:	89 c2                	mov    %eax,%edx
  1007b4:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007b8:	83 c0 08             	add    $0x8,%eax
  1007bb:	89 01                	mov    %eax,(%rcx)
  1007bd:	8b 02                	mov    (%rdx),%eax
  1007bf:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1007c2:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1007c6:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  1007ca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  1007d0:	e9 ff fd ff ff       	jmpq   1005d4 <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
  1007d5:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1007d9:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1007dd:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007e1:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007e5:	eb d6                	jmp    1007bd <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
  1007e7:	84 d2                	test   %dl,%dl
  1007e9:	0f 85 39 01 00 00    	jne    100928 <printer_vprintf+0x6ae>
  1007ef:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  1007f3:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  1007f7:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
  1007fb:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  1007ff:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100805:	e9 ca fd ff ff       	jmpq   1005d4 <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
  10080a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  100810:	bf 80 0e 10 00       	mov    $0x100e80,%edi
        if (flags & FLAG_NUMERIC) {
  100815:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  10081a:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  10081e:	4c 89 c1             	mov    %r8,%rcx
  100821:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
  100825:	48 63 f6             	movslq %esi,%rsi
  100828:	49 83 ec 01          	sub    $0x1,%r12
  10082c:	48 89 c8             	mov    %rcx,%rax
  10082f:	ba 00 00 00 00       	mov    $0x0,%edx
  100834:	48 f7 f6             	div    %rsi
  100837:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  10083b:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
  10083f:	48 89 ca             	mov    %rcx,%rdx
  100842:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  100845:	48 39 d6             	cmp    %rdx,%rsi
  100848:	76 de                	jbe    100828 <printer_vprintf+0x5ae>
  10084a:	e9 9a fd ff ff       	jmpq   1005e9 <printer_vprintf+0x36f>
                prefix = "-";
  10084f:	48 c7 45 a0 94 0c 10 	movq   $0x100c94,-0x60(%rbp)
  100856:	00 
            if (flags & FLAG_NEGATIVE) {
  100857:	8b 45 a8             	mov    -0x58(%rbp),%eax
  10085a:	a8 80                	test   $0x80,%al
  10085c:	0f 85 b0 fd ff ff    	jne    100612 <printer_vprintf+0x398>
                prefix = "+";
  100862:	48 c7 45 a0 8f 0c 10 	movq   $0x100c8f,-0x60(%rbp)
  100869:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  10086a:	a8 10                	test   $0x10,%al
  10086c:	0f 85 a0 fd ff ff    	jne    100612 <printer_vprintf+0x398>
                prefix = " ";
  100872:	a8 08                	test   $0x8,%al
  100874:	ba a0 0e 10 00       	mov    $0x100ea0,%edx
  100879:	b8 9d 0e 10 00       	mov    $0x100e9d,%eax
  10087e:	48 0f 44 c2          	cmove  %rdx,%rax
  100882:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  100886:	e9 87 fd ff ff       	jmpq   100612 <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
  10088b:	41 8d 41 10          	lea    0x10(%r9),%eax
  10088f:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100894:	0f 85 78 fd ff ff    	jne    100612 <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
  10089a:	4d 85 c0             	test   %r8,%r8
  10089d:	75 0d                	jne    1008ac <printer_vprintf+0x632>
  10089f:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
  1008a6:	0f 84 66 fd ff ff    	je     100612 <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
  1008ac:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  1008b0:	ba 96 0c 10 00       	mov    $0x100c96,%edx
  1008b5:	b8 91 0c 10 00       	mov    $0x100c91,%eax
  1008ba:	48 0f 44 c2          	cmove  %rdx,%rax
  1008be:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  1008c2:	e9 4b fd ff ff       	jmpq   100612 <printer_vprintf+0x398>
            len = strlen(data);
  1008c7:	4c 89 e7             	mov    %r12,%rdi
  1008ca:	e8 b5 f8 ff ff       	callq  100184 <strlen>
  1008cf:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
  1008d2:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
  1008d6:	0f 84 63 fd ff ff    	je     10063f <printer_vprintf+0x3c5>
  1008dc:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
  1008e0:	0f 84 59 fd ff ff    	je     10063f <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
  1008e6:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  1008e9:	89 ca                	mov    %ecx,%edx
  1008eb:	29 c2                	sub    %eax,%edx
  1008ed:	39 c1                	cmp    %eax,%ecx
  1008ef:	b8 00 00 00 00       	mov    $0x0,%eax
  1008f4:	0f 4e d0             	cmovle %eax,%edx
  1008f7:	89 55 9c             	mov    %edx,-0x64(%rbp)
  1008fa:	e9 56 fd ff ff       	jmpq   100655 <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
  1008ff:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  100903:	e8 7c f8 ff ff       	callq  100184 <strlen>
  100908:	8b 7d 98             	mov    -0x68(%rbp),%edi
  10090b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
  10090e:	44 89 e9             	mov    %r13d,%ecx
  100911:	29 f9                	sub    %edi,%ecx
  100913:	29 c1                	sub    %eax,%ecx
  100915:	44 39 ea             	cmp    %r13d,%edx
  100918:	b8 00 00 00 00       	mov    $0x0,%eax
  10091d:	0f 4d c8             	cmovge %eax,%ecx
  100920:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
  100923:	e9 2d fd ff ff       	jmpq   100655 <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
  100928:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
  10092b:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  10092f:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  100933:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100939:	e9 96 fc ff ff       	jmpq   1005d4 <printer_vprintf+0x35a>
        int flags = 0;
  10093e:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  100945:	e9 b0 f9 ff ff       	jmpq   1002fa <printer_vprintf+0x80>
}
  10094a:	48 83 c4 58          	add    $0x58,%rsp
  10094e:	5b                   	pop    %rbx
  10094f:	41 5c                	pop    %r12
  100951:	41 5d                	pop    %r13
  100953:	41 5e                	pop    %r14
  100955:	41 5f                	pop    %r15
  100957:	5d                   	pop    %rbp
  100958:	c3                   	retq   

0000000000100959 <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  100959:	55                   	push   %rbp
  10095a:	48 89 e5             	mov    %rsp,%rbp
  10095d:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
  100961:	48 c7 45 f0 64 00 10 	movq   $0x100064,-0x10(%rbp)
  100968:	00 
        cpos = 0;
  100969:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
  10096f:	b8 00 00 00 00       	mov    $0x0,%eax
  100974:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
  100977:	48 63 ff             	movslq %edi,%rdi
  10097a:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
  100981:	00 
  100982:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
  100986:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
  10098a:	e8 eb f8 ff ff       	callq  10027a <printer_vprintf>
    return cp.cursor - console;
  10098f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100993:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100999:	48 d1 f8             	sar    %rax
}
  10099c:	c9                   	leaveq 
  10099d:	c3                   	retq   

000000000010099e <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
  10099e:	55                   	push   %rbp
  10099f:	48 89 e5             	mov    %rsp,%rbp
  1009a2:	48 83 ec 50          	sub    $0x50,%rsp
  1009a6:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1009aa:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1009ae:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
  1009b2:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  1009b9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1009bd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1009c1:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1009c5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  1009c9:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1009cd:	e8 87 ff ff ff       	callq  100959 <console_vprintf>
}
  1009d2:	c9                   	leaveq 
  1009d3:	c3                   	retq   

00000000001009d4 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
  1009d4:	55                   	push   %rbp
  1009d5:	48 89 e5             	mov    %rsp,%rbp
  1009d8:	53                   	push   %rbx
  1009d9:	48 83 ec 28          	sub    $0x28,%rsp
  1009dd:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
  1009e0:	48 c7 45 d8 ea 00 10 	movq   $0x1000ea,-0x28(%rbp)
  1009e7:	00 
    sp.s = s;
  1009e8:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
  1009ec:	48 85 f6             	test   %rsi,%rsi
  1009ef:	75 0b                	jne    1009fc <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
  1009f1:	8b 45 e0             	mov    -0x20(%rbp),%eax
  1009f4:	29 d8                	sub    %ebx,%eax
}
  1009f6:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  1009fa:	c9                   	leaveq 
  1009fb:	c3                   	retq   
        sp.end = s + size - 1;
  1009fc:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
  100a01:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
  100a05:	be 00 00 00 00       	mov    $0x0,%esi
  100a0a:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  100a0e:	e8 67 f8 ff ff       	callq  10027a <printer_vprintf>
        *sp.s = 0;
  100a13:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100a17:	c6 00 00             	movb   $0x0,(%rax)
  100a1a:	eb d5                	jmp    1009f1 <vsnprintf+0x1d>

0000000000100a1c <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
  100a1c:	55                   	push   %rbp
  100a1d:	48 89 e5             	mov    %rsp,%rbp
  100a20:	48 83 ec 50          	sub    $0x50,%rsp
  100a24:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100a28:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100a2c:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100a30:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100a37:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100a3b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100a3f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100a43:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100a47:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100a4b:	e8 84 ff ff ff       	callq  1009d4 <vsnprintf>
    va_end(val);
    return n;
}
  100a50:	c9                   	leaveq 
  100a51:	c3                   	retq   

0000000000100a52 <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  100a52:	b8 00 80 0b 00       	mov    $0xb8000,%eax
  100a57:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
  100a5c:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  100a61:	48 83 c0 02          	add    $0x2,%rax
  100a65:	48 39 d0             	cmp    %rdx,%rax
  100a68:	75 f2                	jne    100a5c <console_clear+0xa>
    }
    cursorpos = 0;
  100a6a:	c7 05 88 85 fb ff 00 	movl   $0x0,-0x47a78(%rip)        # b8ffc <cursorpos>
  100a71:	00 00 00 
}
  100a74:	c3                   	retq   

0000000000100a75 <app_printf>:
#include "process.h"

// app_printf
//     A version of console_printf that picks a sensible color by process ID.

void app_printf(int colorid, const char* format, ...) {
  100a75:	55                   	push   %rbp
  100a76:	48 89 e5             	mov    %rsp,%rbp
  100a79:	48 83 ec 50          	sub    $0x50,%rsp
  100a7d:	49 89 f2             	mov    %rsi,%r10
  100a80:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  100a84:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100a88:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100a8c:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    int color;
    if (colorid < 0) {
        color = 0x0700;
  100a90:	be 00 07 00 00       	mov    $0x700,%esi
    if (colorid < 0) {
  100a95:	85 ff                	test   %edi,%edi
  100a97:	78 2e                	js     100ac7 <app_printf+0x52>
    } else {
        static const uint8_t col[] = { 0x0E, 0x0F, 0x0C, 0x0A, 0x09 };
        color = col[colorid % sizeof(col)] << 8;
  100a99:	48 63 ff             	movslq %edi,%rdi
  100a9c:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
  100aa3:	cc cc cc 
  100aa6:	48 89 f8             	mov    %rdi,%rax
  100aa9:	48 f7 e2             	mul    %rdx
  100aac:	48 89 d0             	mov    %rdx,%rax
  100aaf:	48 c1 e8 02          	shr    $0x2,%rax
  100ab3:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
  100ab7:	48 01 c2             	add    %rax,%rdx
  100aba:	48 29 d7             	sub    %rdx,%rdi
  100abd:	0f b6 b7 cd 0e 10 00 	movzbl 0x100ecd(%rdi),%esi
  100ac4:	c1 e6 08             	shl    $0x8,%esi
    }

    va_list val;
    va_start(val, format);
  100ac7:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%rbp)
  100ace:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100ad2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100ad6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100ada:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cursorpos = console_vprintf(cursorpos, color, format, val);
  100ade:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100ae2:	4c 89 d2             	mov    %r10,%rdx
  100ae5:	8b 3d 11 85 fb ff    	mov    -0x47aef(%rip),%edi        # b8ffc <cursorpos>
  100aeb:	e8 69 fe ff ff       	callq  100959 <console_vprintf>
    va_end(val);

    if (CROW(cursorpos) >= 23) {
        cursorpos = CPOS(0, 0);
  100af0:	3d 30 07 00 00       	cmp    $0x730,%eax
  100af5:	ba 00 00 00 00       	mov    $0x0,%edx
  100afa:	0f 4d c2             	cmovge %edx,%eax
  100afd:	89 05 f9 84 fb ff    	mov    %eax,-0x47b07(%rip)        # b8ffc <cursorpos>
    }
}
  100b03:	c9                   	leaveq 
  100b04:	c3                   	retq   

0000000000100b05 <panic>:


// panic, assert_fail
//     Call the INT_SYS_PANIC system call so the kernel loops until Control-C.

void panic(const char* format, ...) {
  100b05:	55                   	push   %rbp
  100b06:	48 89 e5             	mov    %rsp,%rbp
  100b09:	53                   	push   %rbx
  100b0a:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  100b11:	48 89 fb             	mov    %rdi,%rbx
  100b14:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
  100b18:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  100b1c:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  100b20:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
  100b24:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
    va_list val;
    va_start(val, format);
  100b28:	c7 45 a8 08 00 00 00 	movl   $0x8,-0x58(%rbp)
  100b2f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100b33:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  100b37:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  100b3b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    char buf[160];
    memcpy(buf, "PANIC: ", 7);
  100b3f:	ba 07 00 00 00       	mov    $0x7,%edx
  100b44:	be 97 0e 10 00       	mov    $0x100e97,%esi
  100b49:	48 8d bd 08 ff ff ff 	lea    -0xf8(%rbp),%rdi
  100b50:	e8 ab f5 ff ff       	callq  100100 <memcpy>
    int len = vsnprintf(&buf[7], sizeof(buf) - 7, format, val) + 7;
  100b55:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
  100b59:	48 89 da             	mov    %rbx,%rdx
  100b5c:	be 99 00 00 00       	mov    $0x99,%esi
  100b61:	48 8d bd 0f ff ff ff 	lea    -0xf1(%rbp),%rdi
  100b68:	e8 67 fe ff ff       	callq  1009d4 <vsnprintf>
  100b6d:	8d 50 07             	lea    0x7(%rax),%edx
    va_end(val);
    if (len > 0 && buf[len - 1] != '\n') {
  100b70:	85 d2                	test   %edx,%edx
  100b72:	7e 0f                	jle    100b83 <panic+0x7e>
  100b74:	83 c0 06             	add    $0x6,%eax
  100b77:	48 98                	cltq   
  100b79:	80 bc 05 08 ff ff ff 	cmpb   $0xa,-0xf8(%rbp,%rax,1)
  100b80:	0a 
  100b81:	75 29                	jne    100bac <panic+0xa7>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
  100b83:	48 8d 8d 08 ff ff ff 	lea    -0xf8(%rbp),%rcx
  100b8a:	ba a1 0e 10 00       	mov    $0x100ea1,%edx
  100b8f:	be 00 c0 00 00       	mov    $0xc000,%esi
  100b94:	bf 30 07 00 00       	mov    $0x730,%edi
  100b99:	b8 00 00 00 00       	mov    $0x0,%eax
  100b9e:	e8 fb fd ff ff       	callq  10099e <console_printf>
}

// sys_panic(msg)
//    Panic.
static inline pid_t __attribute__((noreturn)) sys_panic(const char* msg) {
    asm volatile ("int %0" : /* no result */
  100ba3:	bf 00 00 00 00       	mov    $0x0,%edi
  100ba8:	cd 30                	int    $0x30
                  : "i" (INT_SYS_PANIC), "D" (msg)
                  : "cc", "memory");
 loop: goto loop;
  100baa:	eb fe                	jmp    100baa <panic+0xa5>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
  100bac:	48 63 c2             	movslq %edx,%rax
  100baf:	81 fa 9f 00 00 00    	cmp    $0x9f,%edx
  100bb5:	0f 94 c2             	sete   %dl
  100bb8:	0f b6 d2             	movzbl %dl,%edx
  100bbb:	48 29 d0             	sub    %rdx,%rax
  100bbe:	48 8d bc 05 08 ff ff 	lea    -0xf8(%rbp,%rax,1),%rdi
  100bc5:	ff 
  100bc6:	be 9f 0e 10 00       	mov    $0x100e9f,%esi
  100bcb:	e8 f2 f5 ff ff       	callq  1001c2 <strcpy>
  100bd0:	eb b1                	jmp    100b83 <panic+0x7e>

0000000000100bd2 <assert_fail>:
    sys_panic(NULL);
 spinloop: goto spinloop;       // should never get here
}

void assert_fail(const char* file, int line, const char* msg) {
  100bd2:	55                   	push   %rbp
  100bd3:	48 89 e5             	mov    %rsp,%rbp
  100bd6:	48 89 f9             	mov    %rdi,%rcx
  100bd9:	41 89 f0             	mov    %esi,%r8d
  100bdc:	49 89 d1             	mov    %rdx,%r9
    (void) console_printf(CPOS(23, 0), 0xC000,
  100bdf:	ba a8 0e 10 00       	mov    $0x100ea8,%edx
  100be4:	be 00 c0 00 00       	mov    $0xc000,%esi
  100be9:	bf 30 07 00 00       	mov    $0x730,%edi
  100bee:	b8 00 00 00 00       	mov    $0x0,%eax
  100bf3:	e8 a6 fd ff ff       	callq  10099e <console_printf>
    asm volatile ("int %0" : /* no result */
  100bf8:	bf 00 00 00 00       	mov    $0x0,%edi
  100bfd:	cd 30                	int    $0x30
 loop: goto loop;
  100bff:	eb fe                	jmp    100bff <assert_fail+0x2d>
