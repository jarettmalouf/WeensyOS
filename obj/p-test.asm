
obj/p-test.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main>:

#define N 30
#define MEMSIZE_VIRTUAL 0x300000
extern uint8_t end[];

void process_main(void) {
  100000:	55                   	push   %rbp
  100001:	48 89 e5             	mov    %rsp,%rbp
  100004:	48 83 ec 20          	sub    $0x20,%rsp

// sys_getpid
//    Return current process ID.
static inline pid_t sys_getpid(void) {
    pid_t result;
    asm volatile ("int %1" : "=a" (result)
  100008:	cd 31                	int    $0x31
  10000a:	89 c7                	mov    %eax,%edi
    pid_t p = sys_getpid();
    srand(p);
  10000c:	e8 61 02 00 00       	callq  100272 <srand>
    return rbp;
}

static inline uintptr_t read_rsp(void) {
    uintptr_t rsp;
    asm volatile("movq %%rsp,%0" : "=r" (rsp));
  100011:	48 89 e0             	mov    %rsp,%rax

    // lets first check where stack is in VM
    uint8_t * stack_bottom = ROUNDDOWN((uint8_t*) read_rsp() - 1, PAGESIZE);
  100014:	48 83 e8 01          	sub    $0x1,%rax
  100018:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax

    // we want it to be at the end of VM, i.e. 0x300000
    assert((uintptr_t)stack_bottom == (MEMSIZE_VIRTUAL - PAGESIZE));
  10001e:	48 3d 00 f0 2f 00    	cmp    $0x2ff000,%rax
  100024:	75 24                	jne    10004a <process_main+0x4a>
// looks up the virtual memory mapping for addr for the current process 
// and stores it inside map. [map, sizeof(vampping)) address should be 
// allocated, writable addresses to the process, otherwise syscall will 
// not write anything to the variable
static inline void sys_mapping(uintptr_t addr, void * map){
    asm volatile ("int %0" : /* no result */
  100026:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
  10002a:	be 00 f0 2f 00       	mov    $0x2ff000,%esi
  10002f:	cd 36                	int    $0x36

    // Now, lets check how its allocated
    vamapping smap;
    sys_mapping((uintptr_t) stack_bottom, &smap);

    if(smap.pa == (uintptr_t)stack_bottom){
  100031:	48 81 7d f0 00 f0 2f 	cmpq   $0x2ff000,-0x10(%rbp)
  100038:	00 
  100039:	74 23                	je     10005e <process_main+0x5e>
    }

    // No need to check perm, otherwise nothing will work
    int i = p;
    assert(i == p);
    TEST_PASS();
  10003b:	bf 79 0c 10 00       	mov    $0x100c79,%edi
  100040:	b8 00 00 00 00       	mov    $0x0,%eax
  100045:	e8 c4 0a 00 00       	callq  100b0e <panic>
    assert((uintptr_t)stack_bottom == (MEMSIZE_VIRTUAL - PAGESIZE));
  10004a:	ba 10 0c 10 00       	mov    $0x100c10,%edx
  10004f:	be 10 00 00 00       	mov    $0x10,%esi
  100054:	bf 70 0c 10 00       	mov    $0x100c70,%edi
  100059:	e8 7d 0b 00 00       	callq  100bdb <assert_fail>
        panic("Error, stack is not allocated virtually");
  10005e:	bf 48 0c 10 00       	mov    $0x100c48,%edi
  100063:	b8 00 00 00 00       	mov    $0x0,%eax
  100068:	e8 a1 0a 00 00       	callq  100b0e <panic>

000000000010006d <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
  10006d:	48 89 f9             	mov    %rdi,%rcx
  100070:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100072:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
  100079:	00 
  10007a:	72 08                	jb     100084 <console_putc+0x17>
        cp->cursor = console;
  10007c:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
  100083:	00 
    }
    if (c == '\n') {
  100084:	40 80 fe 0a          	cmp    $0xa,%sil
  100088:	74 16                	je     1000a0 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
  10008a:	48 8b 41 08          	mov    0x8(%rcx),%rax
  10008e:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100092:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  100096:	40 0f b6 f6          	movzbl %sil,%esi
  10009a:	09 fe                	or     %edi,%esi
  10009c:	66 89 30             	mov    %si,(%rax)
    }
}
  10009f:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
  1000a0:	4c 8b 41 08          	mov    0x8(%rcx),%r8
  1000a4:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
  1000ab:	4c 89 c6             	mov    %r8,%rsi
  1000ae:	48 d1 fe             	sar    %rsi
  1000b1:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  1000b8:	66 66 66 
  1000bb:	48 89 f0             	mov    %rsi,%rax
  1000be:	48 f7 ea             	imul   %rdx
  1000c1:	48 c1 fa 05          	sar    $0x5,%rdx
  1000c5:	49 c1 f8 3f          	sar    $0x3f,%r8
  1000c9:	4c 29 c2             	sub    %r8,%rdx
  1000cc:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  1000d0:	48 c1 e2 04          	shl    $0x4,%rdx
  1000d4:	89 f0                	mov    %esi,%eax
  1000d6:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
  1000d8:	83 cf 20             	or     $0x20,%edi
  1000db:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1000df:	48 8d 72 02          	lea    0x2(%rdx),%rsi
  1000e3:	48 89 71 08          	mov    %rsi,0x8(%rcx)
  1000e7:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
  1000ea:	83 c0 01             	add    $0x1,%eax
  1000ed:	83 f8 50             	cmp    $0x50,%eax
  1000f0:	75 e9                	jne    1000db <console_putc+0x6e>
  1000f2:	c3                   	retq   

00000000001000f3 <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
  1000f3:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1000f7:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1000fb:	73 0b                	jae    100108 <string_putc+0x15>
        *sp->s++ = c;
  1000fd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  100101:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  100105:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
  100108:	c3                   	retq   

0000000000100109 <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
  100109:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  10010c:	48 85 d2             	test   %rdx,%rdx
  10010f:	74 17                	je     100128 <memcpy+0x1f>
  100111:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
  100116:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
  10011b:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  10011f:	48 83 c1 01          	add    $0x1,%rcx
  100123:	48 39 d1             	cmp    %rdx,%rcx
  100126:	75 ee                	jne    100116 <memcpy+0xd>
}
  100128:	c3                   	retq   

0000000000100129 <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
  100129:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
  10012c:	48 39 fe             	cmp    %rdi,%rsi
  10012f:	72 1d                	jb     10014e <memmove+0x25>
        while (n-- > 0) {
  100131:	b9 00 00 00 00       	mov    $0x0,%ecx
  100136:	48 85 d2             	test   %rdx,%rdx
  100139:	74 12                	je     10014d <memmove+0x24>
            *d++ = *s++;
  10013b:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  10013f:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  100143:	48 83 c1 01          	add    $0x1,%rcx
  100147:	48 39 ca             	cmp    %rcx,%rdx
  10014a:	75 ef                	jne    10013b <memmove+0x12>
}
  10014c:	c3                   	retq   
  10014d:	c3                   	retq   
    if (s < d && s + n > d) {
  10014e:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  100152:	48 39 cf             	cmp    %rcx,%rdi
  100155:	73 da                	jae    100131 <memmove+0x8>
        while (n-- > 0) {
  100157:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  10015b:	48 85 d2             	test   %rdx,%rdx
  10015e:	74 ec                	je     10014c <memmove+0x23>
            *--d = *--s;
  100160:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  100164:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  100167:	48 83 e9 01          	sub    $0x1,%rcx
  10016b:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  10016f:	75 ef                	jne    100160 <memmove+0x37>
  100171:	c3                   	retq   

0000000000100172 <memset>:
void* memset(void* v, int c, size_t n) {
  100172:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100175:	48 85 d2             	test   %rdx,%rdx
  100178:	74 12                	je     10018c <memset+0x1a>
  10017a:	48 01 fa             	add    %rdi,%rdx
  10017d:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
  100180:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100183:	48 83 c1 01          	add    $0x1,%rcx
  100187:	48 39 ca             	cmp    %rcx,%rdx
  10018a:	75 f4                	jne    100180 <memset+0xe>
}
  10018c:	c3                   	retq   

000000000010018d <strlen>:
    for (n = 0; *s != '\0'; ++s) {
  10018d:	80 3f 00             	cmpb   $0x0,(%rdi)
  100190:	74 10                	je     1001a2 <strlen+0x15>
  100192:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  100197:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  10019b:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  10019f:	75 f6                	jne    100197 <strlen+0xa>
  1001a1:	c3                   	retq   
  1001a2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1001a7:	c3                   	retq   

00000000001001a8 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1001a8:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1001ab:	ba 00 00 00 00       	mov    $0x0,%edx
  1001b0:	48 85 f6             	test   %rsi,%rsi
  1001b3:	74 11                	je     1001c6 <strnlen+0x1e>
  1001b5:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1001b9:	74 0c                	je     1001c7 <strnlen+0x1f>
        ++n;
  1001bb:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1001bf:	48 39 d0             	cmp    %rdx,%rax
  1001c2:	75 f1                	jne    1001b5 <strnlen+0xd>
  1001c4:	eb 04                	jmp    1001ca <strnlen+0x22>
  1001c6:	c3                   	retq   
  1001c7:	48 89 d0             	mov    %rdx,%rax
}
  1001ca:	c3                   	retq   

00000000001001cb <strcpy>:
char* strcpy(char* dst, const char* src) {
  1001cb:	48 89 f8             	mov    %rdi,%rax
  1001ce:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
  1001d3:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
  1001d7:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
  1001da:	48 83 c2 01          	add    $0x1,%rdx
  1001de:	84 c9                	test   %cl,%cl
  1001e0:	75 f1                	jne    1001d3 <strcpy+0x8>
}
  1001e2:	c3                   	retq   

00000000001001e3 <strcmp>:
    while (*a && *b && *a == *b) {
  1001e3:	0f b6 07             	movzbl (%rdi),%eax
  1001e6:	84 c0                	test   %al,%al
  1001e8:	74 1a                	je     100204 <strcmp+0x21>
  1001ea:	0f b6 16             	movzbl (%rsi),%edx
  1001ed:	38 c2                	cmp    %al,%dl
  1001ef:	75 13                	jne    100204 <strcmp+0x21>
  1001f1:	84 d2                	test   %dl,%dl
  1001f3:	74 0f                	je     100204 <strcmp+0x21>
        ++a, ++b;
  1001f5:	48 83 c7 01          	add    $0x1,%rdi
  1001f9:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
  1001fd:	0f b6 07             	movzbl (%rdi),%eax
  100200:	84 c0                	test   %al,%al
  100202:	75 e6                	jne    1001ea <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
  100204:	3a 06                	cmp    (%rsi),%al
  100206:	0f 97 c0             	seta   %al
  100209:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
  10020c:	83 d8 00             	sbb    $0x0,%eax
}
  10020f:	c3                   	retq   

0000000000100210 <strchr>:
    while (*s && *s != (char) c) {
  100210:	0f b6 07             	movzbl (%rdi),%eax
  100213:	84 c0                	test   %al,%al
  100215:	74 10                	je     100227 <strchr+0x17>
  100217:	40 38 f0             	cmp    %sil,%al
  10021a:	74 18                	je     100234 <strchr+0x24>
        ++s;
  10021c:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  100220:	0f b6 07             	movzbl (%rdi),%eax
  100223:	84 c0                	test   %al,%al
  100225:	75 f0                	jne    100217 <strchr+0x7>
        return NULL;
  100227:	40 84 f6             	test   %sil,%sil
  10022a:	b8 00 00 00 00       	mov    $0x0,%eax
  10022f:	48 0f 44 c7          	cmove  %rdi,%rax
}
  100233:	c3                   	retq   
  100234:	48 89 f8             	mov    %rdi,%rax
  100237:	c3                   	retq   

0000000000100238 <rand>:
    if (!rand_seed_set) {
  100238:	83 3d c5 0d 00 00 00 	cmpl   $0x0,0xdc5(%rip)        # 101004 <rand_seed_set>
  10023f:	74 1b                	je     10025c <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
  100241:	69 05 b5 0d 00 00 0d 	imul   $0x19660d,0xdb5(%rip),%eax        # 101000 <rand_seed>
  100248:	66 19 00 
  10024b:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  100250:	89 05 aa 0d 00 00    	mov    %eax,0xdaa(%rip)        # 101000 <rand_seed>
    return rand_seed & RAND_MAX;
  100256:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  10025b:	c3                   	retq   
    rand_seed = seed;
  10025c:	c7 05 9a 0d 00 00 9e 	movl   $0x30d4879e,0xd9a(%rip)        # 101000 <rand_seed>
  100263:	87 d4 30 
    rand_seed_set = 1;
  100266:	c7 05 94 0d 00 00 01 	movl   $0x1,0xd94(%rip)        # 101004 <rand_seed_set>
  10026d:	00 00 00 
}
  100270:	eb cf                	jmp    100241 <rand+0x9>

0000000000100272 <srand>:
    rand_seed = seed;
  100272:	89 3d 88 0d 00 00    	mov    %edi,0xd88(%rip)        # 101000 <rand_seed>
    rand_seed_set = 1;
  100278:	c7 05 82 0d 00 00 01 	movl   $0x1,0xd82(%rip)        # 101004 <rand_seed_set>
  10027f:	00 00 00 
}
  100282:	c3                   	retq   

0000000000100283 <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
  100283:	55                   	push   %rbp
  100284:	48 89 e5             	mov    %rsp,%rbp
  100287:	41 57                	push   %r15
  100289:	41 56                	push   %r14
  10028b:	41 55                	push   %r13
  10028d:	41 54                	push   %r12
  10028f:	53                   	push   %rbx
  100290:	48 83 ec 58          	sub    $0x58,%rsp
  100294:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  100298:	0f b6 02             	movzbl (%rdx),%eax
  10029b:	84 c0                	test   %al,%al
  10029d:	0f 84 b0 06 00 00    	je     100953 <printer_vprintf+0x6d0>
  1002a3:	49 89 fe             	mov    %rdi,%r14
  1002a6:	49 89 d4             	mov    %rdx,%r12
            length = 1;
  1002a9:	41 89 f7             	mov    %esi,%r15d
  1002ac:	e9 a4 04 00 00       	jmpq   100755 <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
  1002b1:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1002b6:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1002bc:	45 84 e4             	test   %r12b,%r12b
  1002bf:	0f 84 82 06 00 00    	je     100947 <printer_vprintf+0x6c4>
        int flags = 0;
  1002c5:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  1002cb:	41 0f be f4          	movsbl %r12b,%esi
  1002cf:	bf 91 0e 10 00       	mov    $0x100e91,%edi
  1002d4:	e8 37 ff ff ff       	callq  100210 <strchr>
  1002d9:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1002dc:	48 85 c0             	test   %rax,%rax
  1002df:	74 55                	je     100336 <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
  1002e1:	48 81 e9 91 0e 10 00 	sub    $0x100e91,%rcx
  1002e8:	b8 01 00 00 00       	mov    $0x1,%eax
  1002ed:	d3 e0                	shl    %cl,%eax
  1002ef:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1002f2:	48 83 c3 01          	add    $0x1,%rbx
  1002f6:	44 0f b6 23          	movzbl (%rbx),%r12d
  1002fa:	45 84 e4             	test   %r12b,%r12b
  1002fd:	75 cc                	jne    1002cb <printer_vprintf+0x48>
  1002ff:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
  100303:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  100309:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
  100310:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  100313:	0f 84 a9 00 00 00    	je     1003c2 <printer_vprintf+0x13f>
        int length = 0;
  100319:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
  10031e:	0f b6 13             	movzbl (%rbx),%edx
  100321:	8d 42 bd             	lea    -0x43(%rdx),%eax
  100324:	3c 37                	cmp    $0x37,%al
  100326:	0f 87 c4 04 00 00    	ja     1007f0 <printer_vprintf+0x56d>
  10032c:	0f b6 c0             	movzbl %al,%eax
  10032f:	ff 24 c5 a0 0c 10 00 	jmpq   *0x100ca0(,%rax,8)
        if (*format >= '1' && *format <= '9') {
  100336:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
  10033a:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  10033f:	3c 08                	cmp    $0x8,%al
  100341:	77 2f                	ja     100372 <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100343:	0f b6 03             	movzbl (%rbx),%eax
  100346:	8d 50 d0             	lea    -0x30(%rax),%edx
  100349:	80 fa 09             	cmp    $0x9,%dl
  10034c:	77 5e                	ja     1003ac <printer_vprintf+0x129>
  10034e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  100354:	48 83 c3 01          	add    $0x1,%rbx
  100358:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  10035d:	0f be c0             	movsbl %al,%eax
  100360:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100365:	0f b6 03             	movzbl (%rbx),%eax
  100368:	8d 50 d0             	lea    -0x30(%rax),%edx
  10036b:	80 fa 09             	cmp    $0x9,%dl
  10036e:	76 e4                	jbe    100354 <printer_vprintf+0xd1>
  100370:	eb 97                	jmp    100309 <printer_vprintf+0x86>
        } else if (*format == '*') {
  100372:	41 80 fc 2a          	cmp    $0x2a,%r12b
  100376:	75 3f                	jne    1003b7 <printer_vprintf+0x134>
            width = va_arg(val, int);
  100378:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10037c:	8b 07                	mov    (%rdi),%eax
  10037e:	83 f8 2f             	cmp    $0x2f,%eax
  100381:	77 17                	ja     10039a <printer_vprintf+0x117>
  100383:	89 c2                	mov    %eax,%edx
  100385:	48 03 57 10          	add    0x10(%rdi),%rdx
  100389:	83 c0 08             	add    $0x8,%eax
  10038c:	89 07                	mov    %eax,(%rdi)
  10038e:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  100391:	48 83 c3 01          	add    $0x1,%rbx
  100395:	e9 6f ff ff ff       	jmpq   100309 <printer_vprintf+0x86>
            width = va_arg(val, int);
  10039a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10039e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1003a2:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1003a6:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1003aa:	eb e2                	jmp    10038e <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1003ac:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1003b2:	e9 52 ff ff ff       	jmpq   100309 <printer_vprintf+0x86>
        int width = -1;
  1003b7:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1003bd:	e9 47 ff ff ff       	jmpq   100309 <printer_vprintf+0x86>
            ++format;
  1003c2:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1003c6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1003ca:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1003cd:	80 f9 09             	cmp    $0x9,%cl
  1003d0:	76 13                	jbe    1003e5 <printer_vprintf+0x162>
            } else if (*format == '*') {
  1003d2:	3c 2a                	cmp    $0x2a,%al
  1003d4:	74 33                	je     100409 <printer_vprintf+0x186>
            ++format;
  1003d6:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1003d9:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
  1003e0:	e9 34 ff ff ff       	jmpq   100319 <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003e5:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1003ea:	48 83 c2 01          	add    $0x1,%rdx
  1003ee:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1003f1:	0f be c0             	movsbl %al,%eax
  1003f4:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003f8:	0f b6 02             	movzbl (%rdx),%eax
  1003fb:	8d 70 d0             	lea    -0x30(%rax),%esi
  1003fe:	40 80 fe 09          	cmp    $0x9,%sil
  100402:	76 e6                	jbe    1003ea <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
  100404:	48 89 d3             	mov    %rdx,%rbx
  100407:	eb 1c                	jmp    100425 <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
  100409:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10040d:	8b 07                	mov    (%rdi),%eax
  10040f:	83 f8 2f             	cmp    $0x2f,%eax
  100412:	77 23                	ja     100437 <printer_vprintf+0x1b4>
  100414:	89 c2                	mov    %eax,%edx
  100416:	48 03 57 10          	add    0x10(%rdi),%rdx
  10041a:	83 c0 08             	add    $0x8,%eax
  10041d:	89 07                	mov    %eax,(%rdi)
  10041f:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  100421:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  100425:	85 c9                	test   %ecx,%ecx
  100427:	b8 00 00 00 00       	mov    $0x0,%eax
  10042c:	0f 49 c1             	cmovns %ecx,%eax
  10042f:	89 45 9c             	mov    %eax,-0x64(%rbp)
  100432:	e9 e2 fe ff ff       	jmpq   100319 <printer_vprintf+0x96>
                precision = va_arg(val, int);
  100437:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10043b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10043f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100443:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100447:	eb d6                	jmp    10041f <printer_vprintf+0x19c>
        switch (*format) {
  100449:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  10044e:	e9 f3 00 00 00       	jmpq   100546 <printer_vprintf+0x2c3>
            ++format;
  100453:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
  100457:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
  10045c:	e9 bd fe ff ff       	jmpq   10031e <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100461:	85 c9                	test   %ecx,%ecx
  100463:	74 55                	je     1004ba <printer_vprintf+0x237>
  100465:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100469:	8b 07                	mov    (%rdi),%eax
  10046b:	83 f8 2f             	cmp    $0x2f,%eax
  10046e:	77 38                	ja     1004a8 <printer_vprintf+0x225>
  100470:	89 c2                	mov    %eax,%edx
  100472:	48 03 57 10          	add    0x10(%rdi),%rdx
  100476:	83 c0 08             	add    $0x8,%eax
  100479:	89 07                	mov    %eax,(%rdi)
  10047b:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  10047e:	48 89 d0             	mov    %rdx,%rax
  100481:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  100485:	49 89 d0             	mov    %rdx,%r8
  100488:	49 f7 d8             	neg    %r8
  10048b:	25 80 00 00 00       	and    $0x80,%eax
  100490:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100494:	0b 45 a8             	or     -0x58(%rbp),%eax
  100497:	83 c8 60             	or     $0x60,%eax
  10049a:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
  10049d:	41 bc a0 0e 10 00    	mov    $0x100ea0,%r12d
            break;
  1004a3:	e9 35 01 00 00       	jmpq   1005dd <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1004a8:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004ac:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1004b0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004b4:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1004b8:	eb c1                	jmp    10047b <printer_vprintf+0x1f8>
  1004ba:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004be:	8b 07                	mov    (%rdi),%eax
  1004c0:	83 f8 2f             	cmp    $0x2f,%eax
  1004c3:	77 10                	ja     1004d5 <printer_vprintf+0x252>
  1004c5:	89 c2                	mov    %eax,%edx
  1004c7:	48 03 57 10          	add    0x10(%rdi),%rdx
  1004cb:	83 c0 08             	add    $0x8,%eax
  1004ce:	89 07                	mov    %eax,(%rdi)
  1004d0:	48 63 12             	movslq (%rdx),%rdx
  1004d3:	eb a9                	jmp    10047e <printer_vprintf+0x1fb>
  1004d5:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004d9:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1004dd:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004e1:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1004e5:	eb e9                	jmp    1004d0 <printer_vprintf+0x24d>
        int base = 10;
  1004e7:	be 0a 00 00 00       	mov    $0xa,%esi
  1004ec:	eb 58                	jmp    100546 <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1004ee:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004f2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1004f6:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004fa:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1004fe:	eb 60                	jmp    100560 <printer_vprintf+0x2dd>
  100500:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100504:	8b 07                	mov    (%rdi),%eax
  100506:	83 f8 2f             	cmp    $0x2f,%eax
  100509:	77 10                	ja     10051b <printer_vprintf+0x298>
  10050b:	89 c2                	mov    %eax,%edx
  10050d:	48 03 57 10          	add    0x10(%rdi),%rdx
  100511:	83 c0 08             	add    $0x8,%eax
  100514:	89 07                	mov    %eax,(%rdi)
  100516:	44 8b 02             	mov    (%rdx),%r8d
  100519:	eb 48                	jmp    100563 <printer_vprintf+0x2e0>
  10051b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10051f:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100523:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100527:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10052b:	eb e9                	jmp    100516 <printer_vprintf+0x293>
  10052d:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  100530:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
  100537:	bf 80 0e 10 00       	mov    $0x100e80,%edi
  10053c:	e9 e2 02 00 00       	jmpq   100823 <printer_vprintf+0x5a0>
            base = 16;
  100541:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100546:	85 c9                	test   %ecx,%ecx
  100548:	74 b6                	je     100500 <printer_vprintf+0x27d>
  10054a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10054e:	8b 01                	mov    (%rcx),%eax
  100550:	83 f8 2f             	cmp    $0x2f,%eax
  100553:	77 99                	ja     1004ee <printer_vprintf+0x26b>
  100555:	89 c2                	mov    %eax,%edx
  100557:	48 03 51 10          	add    0x10(%rcx),%rdx
  10055b:	83 c0 08             	add    $0x8,%eax
  10055e:	89 01                	mov    %eax,(%rcx)
  100560:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  100563:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
  100567:	85 f6                	test   %esi,%esi
  100569:	79 c2                	jns    10052d <printer_vprintf+0x2aa>
        base = -base;
  10056b:	41 89 f1             	mov    %esi,%r9d
  10056e:	f7 de                	neg    %esi
  100570:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
  100577:	bf 60 0e 10 00       	mov    $0x100e60,%edi
  10057c:	e9 a2 02 00 00       	jmpq   100823 <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
  100581:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100585:	8b 07                	mov    (%rdi),%eax
  100587:	83 f8 2f             	cmp    $0x2f,%eax
  10058a:	77 1c                	ja     1005a8 <printer_vprintf+0x325>
  10058c:	89 c2                	mov    %eax,%edx
  10058e:	48 03 57 10          	add    0x10(%rdi),%rdx
  100592:	83 c0 08             	add    $0x8,%eax
  100595:	89 07                	mov    %eax,(%rdi)
  100597:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  10059a:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
  1005a1:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  1005a6:	eb c3                	jmp    10056b <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
  1005a8:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005ac:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1005b0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005b4:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1005b8:	eb dd                	jmp    100597 <printer_vprintf+0x314>
            data = va_arg(val, char*);
  1005ba:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005be:	8b 01                	mov    (%rcx),%eax
  1005c0:	83 f8 2f             	cmp    $0x2f,%eax
  1005c3:	0f 87 a5 01 00 00    	ja     10076e <printer_vprintf+0x4eb>
  1005c9:	89 c2                	mov    %eax,%edx
  1005cb:	48 03 51 10          	add    0x10(%rcx),%rdx
  1005cf:	83 c0 08             	add    $0x8,%eax
  1005d2:	89 01                	mov    %eax,(%rcx)
  1005d4:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  1005d7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
  1005dd:	8b 45 a8             	mov    -0x58(%rbp),%eax
  1005e0:	83 e0 20             	and    $0x20,%eax
  1005e3:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1005e6:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1005ec:	0f 85 21 02 00 00    	jne    100813 <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1005f2:	8b 45 a8             	mov    -0x58(%rbp),%eax
  1005f5:	89 45 88             	mov    %eax,-0x78(%rbp)
  1005f8:	83 e0 60             	and    $0x60,%eax
  1005fb:	83 f8 60             	cmp    $0x60,%eax
  1005fe:	0f 84 54 02 00 00    	je     100858 <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100604:	8b 45 a8             	mov    -0x58(%rbp),%eax
  100607:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  10060a:	48 c7 45 a0 a0 0e 10 	movq   $0x100ea0,-0x60(%rbp)
  100611:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100612:	83 f8 21             	cmp    $0x21,%eax
  100615:	0f 84 79 02 00 00    	je     100894 <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  10061b:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  10061e:	89 f8                	mov    %edi,%eax
  100620:	f7 d0                	not    %eax
  100622:	c1 e8 1f             	shr    $0x1f,%eax
  100625:	89 45 84             	mov    %eax,-0x7c(%rbp)
  100628:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
  10062c:	0f 85 9e 02 00 00    	jne    1008d0 <printer_vprintf+0x64d>
  100632:	84 c0                	test   %al,%al
  100634:	0f 84 96 02 00 00    	je     1008d0 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
  10063a:	48 63 f7             	movslq %edi,%rsi
  10063d:	4c 89 e7             	mov    %r12,%rdi
  100640:	e8 63 fb ff ff       	callq  1001a8 <strnlen>
  100645:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  100648:	8b 45 88             	mov    -0x78(%rbp),%eax
  10064b:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
  10064e:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
  100655:	83 f8 22             	cmp    $0x22,%eax
  100658:	0f 84 aa 02 00 00    	je     100908 <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
  10065e:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  100662:	e8 26 fb ff ff       	callq  10018d <strlen>
  100667:	8b 55 9c             	mov    -0x64(%rbp),%edx
  10066a:	03 55 98             	add    -0x68(%rbp),%edx
  10066d:	44 89 e9             	mov    %r13d,%ecx
  100670:	29 d1                	sub    %edx,%ecx
  100672:	29 c1                	sub    %eax,%ecx
  100674:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
  100677:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10067a:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
  10067e:	75 2d                	jne    1006ad <printer_vprintf+0x42a>
  100680:	85 c9                	test   %ecx,%ecx
  100682:	7e 29                	jle    1006ad <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
  100684:	44 89 fa             	mov    %r15d,%edx
  100687:	be 20 00 00 00       	mov    $0x20,%esi
  10068c:	4c 89 f7             	mov    %r14,%rdi
  10068f:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100692:	41 83 ed 01          	sub    $0x1,%r13d
  100696:	45 85 ed             	test   %r13d,%r13d
  100699:	7f e9                	jg     100684 <printer_vprintf+0x401>
  10069b:	8b 7d 8c             	mov    -0x74(%rbp),%edi
  10069e:	85 ff                	test   %edi,%edi
  1006a0:	b8 01 00 00 00       	mov    $0x1,%eax
  1006a5:	0f 4f c7             	cmovg  %edi,%eax
  1006a8:	29 c7                	sub    %eax,%edi
  1006aa:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  1006ad:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  1006b1:	0f b6 07             	movzbl (%rdi),%eax
  1006b4:	84 c0                	test   %al,%al
  1006b6:	74 22                	je     1006da <printer_vprintf+0x457>
  1006b8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006bc:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
  1006bf:	0f b6 f0             	movzbl %al,%esi
  1006c2:	44 89 fa             	mov    %r15d,%edx
  1006c5:	4c 89 f7             	mov    %r14,%rdi
  1006c8:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
  1006cb:	48 83 c3 01          	add    $0x1,%rbx
  1006cf:	0f b6 03             	movzbl (%rbx),%eax
  1006d2:	84 c0                	test   %al,%al
  1006d4:	75 e9                	jne    1006bf <printer_vprintf+0x43c>
  1006d6:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
  1006da:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1006dd:	85 c0                	test   %eax,%eax
  1006df:	7e 1d                	jle    1006fe <printer_vprintf+0x47b>
  1006e1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006e5:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
  1006e7:	44 89 fa             	mov    %r15d,%edx
  1006ea:	be 30 00 00 00       	mov    $0x30,%esi
  1006ef:	4c 89 f7             	mov    %r14,%rdi
  1006f2:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
  1006f5:	83 eb 01             	sub    $0x1,%ebx
  1006f8:	75 ed                	jne    1006e7 <printer_vprintf+0x464>
  1006fa:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
  1006fe:	8b 45 98             	mov    -0x68(%rbp),%eax
  100701:	85 c0                	test   %eax,%eax
  100703:	7e 27                	jle    10072c <printer_vprintf+0x4a9>
  100705:	89 c0                	mov    %eax,%eax
  100707:	4c 01 e0             	add    %r12,%rax
  10070a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10070e:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
  100711:	41 0f b6 34 24       	movzbl (%r12),%esi
  100716:	44 89 fa             	mov    %r15d,%edx
  100719:	4c 89 f7             	mov    %r14,%rdi
  10071c:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
  10071f:	49 83 c4 01          	add    $0x1,%r12
  100723:	49 39 dc             	cmp    %rbx,%r12
  100726:	75 e9                	jne    100711 <printer_vprintf+0x48e>
  100728:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
  10072c:	45 85 ed             	test   %r13d,%r13d
  10072f:	7e 14                	jle    100745 <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
  100731:	44 89 fa             	mov    %r15d,%edx
  100734:	be 20 00 00 00       	mov    $0x20,%esi
  100739:	4c 89 f7             	mov    %r14,%rdi
  10073c:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
  10073f:	41 83 ed 01          	sub    $0x1,%r13d
  100743:	75 ec                	jne    100731 <printer_vprintf+0x4ae>
    for (; *format; ++format) {
  100745:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  100749:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  10074d:	84 c0                	test   %al,%al
  10074f:	0f 84 fe 01 00 00    	je     100953 <printer_vprintf+0x6d0>
        if (*format != '%') {
  100755:	3c 25                	cmp    $0x25,%al
  100757:	0f 84 54 fb ff ff    	je     1002b1 <printer_vprintf+0x2e>
            p->putc(p, *format, color);
  10075d:	0f b6 f0             	movzbl %al,%esi
  100760:	44 89 fa             	mov    %r15d,%edx
  100763:	4c 89 f7             	mov    %r14,%rdi
  100766:	41 ff 16             	callq  *(%r14)
            continue;
  100769:	4c 89 e3             	mov    %r12,%rbx
  10076c:	eb d7                	jmp    100745 <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
  10076e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100772:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100776:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10077a:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10077e:	e9 51 fe ff ff       	jmpq   1005d4 <printer_vprintf+0x351>
            color = va_arg(val, int);
  100783:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100787:	8b 07                	mov    (%rdi),%eax
  100789:	83 f8 2f             	cmp    $0x2f,%eax
  10078c:	77 10                	ja     10079e <printer_vprintf+0x51b>
  10078e:	89 c2                	mov    %eax,%edx
  100790:	48 03 57 10          	add    0x10(%rdi),%rdx
  100794:	83 c0 08             	add    $0x8,%eax
  100797:	89 07                	mov    %eax,(%rdi)
  100799:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
  10079c:	eb a7                	jmp    100745 <printer_vprintf+0x4c2>
            color = va_arg(val, int);
  10079e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007a2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007a6:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007aa:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007ae:	eb e9                	jmp    100799 <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
  1007b0:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007b4:	8b 01                	mov    (%rcx),%eax
  1007b6:	83 f8 2f             	cmp    $0x2f,%eax
  1007b9:	77 23                	ja     1007de <printer_vprintf+0x55b>
  1007bb:	89 c2                	mov    %eax,%edx
  1007bd:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007c1:	83 c0 08             	add    $0x8,%eax
  1007c4:	89 01                	mov    %eax,(%rcx)
  1007c6:	8b 02                	mov    (%rdx),%eax
  1007c8:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1007cb:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1007cf:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  1007d3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  1007d9:	e9 ff fd ff ff       	jmpq   1005dd <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
  1007de:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1007e2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1007e6:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007ea:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007ee:	eb d6                	jmp    1007c6 <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
  1007f0:	84 d2                	test   %dl,%dl
  1007f2:	0f 85 39 01 00 00    	jne    100931 <printer_vprintf+0x6ae>
  1007f8:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  1007fc:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  100800:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
  100804:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  100808:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  10080e:	e9 ca fd ff ff       	jmpq   1005dd <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
  100813:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  100819:	bf 80 0e 10 00       	mov    $0x100e80,%edi
        if (flags & FLAG_NUMERIC) {
  10081e:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  100823:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  100827:	4c 89 c1             	mov    %r8,%rcx
  10082a:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
  10082e:	48 63 f6             	movslq %esi,%rsi
  100831:	49 83 ec 01          	sub    $0x1,%r12
  100835:	48 89 c8             	mov    %rcx,%rax
  100838:	ba 00 00 00 00       	mov    $0x0,%edx
  10083d:	48 f7 f6             	div    %rsi
  100840:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  100844:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
  100848:	48 89 ca             	mov    %rcx,%rdx
  10084b:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  10084e:	48 39 d6             	cmp    %rdx,%rsi
  100851:	76 de                	jbe    100831 <printer_vprintf+0x5ae>
  100853:	e9 9a fd ff ff       	jmpq   1005f2 <printer_vprintf+0x36f>
                prefix = "-";
  100858:	48 c7 45 a0 92 0c 10 	movq   $0x100c92,-0x60(%rbp)
  10085f:	00 
            if (flags & FLAG_NEGATIVE) {
  100860:	8b 45 a8             	mov    -0x58(%rbp),%eax
  100863:	a8 80                	test   $0x80,%al
  100865:	0f 85 b0 fd ff ff    	jne    10061b <printer_vprintf+0x398>
                prefix = "+";
  10086b:	48 c7 45 a0 8d 0c 10 	movq   $0x100c8d,-0x60(%rbp)
  100872:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100873:	a8 10                	test   $0x10,%al
  100875:	0f 85 a0 fd ff ff    	jne    10061b <printer_vprintf+0x398>
                prefix = " ";
  10087b:	a8 08                	test   $0x8,%al
  10087d:	ba a0 0e 10 00       	mov    $0x100ea0,%edx
  100882:	b8 9d 0e 10 00       	mov    $0x100e9d,%eax
  100887:	48 0f 44 c2          	cmove  %rdx,%rax
  10088b:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  10088f:	e9 87 fd ff ff       	jmpq   10061b <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
  100894:	41 8d 41 10          	lea    0x10(%r9),%eax
  100898:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  10089d:	0f 85 78 fd ff ff    	jne    10061b <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
  1008a3:	4d 85 c0             	test   %r8,%r8
  1008a6:	75 0d                	jne    1008b5 <printer_vprintf+0x632>
  1008a8:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
  1008af:	0f 84 66 fd ff ff    	je     10061b <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
  1008b5:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  1008b9:	ba 94 0c 10 00       	mov    $0x100c94,%edx
  1008be:	b8 8f 0c 10 00       	mov    $0x100c8f,%eax
  1008c3:	48 0f 44 c2          	cmove  %rdx,%rax
  1008c7:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  1008cb:	e9 4b fd ff ff       	jmpq   10061b <printer_vprintf+0x398>
            len = strlen(data);
  1008d0:	4c 89 e7             	mov    %r12,%rdi
  1008d3:	e8 b5 f8 ff ff       	callq  10018d <strlen>
  1008d8:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
  1008db:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
  1008df:	0f 84 63 fd ff ff    	je     100648 <printer_vprintf+0x3c5>
  1008e5:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
  1008e9:	0f 84 59 fd ff ff    	je     100648 <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
  1008ef:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  1008f2:	89 ca                	mov    %ecx,%edx
  1008f4:	29 c2                	sub    %eax,%edx
  1008f6:	39 c1                	cmp    %eax,%ecx
  1008f8:	b8 00 00 00 00       	mov    $0x0,%eax
  1008fd:	0f 4e d0             	cmovle %eax,%edx
  100900:	89 55 9c             	mov    %edx,-0x64(%rbp)
  100903:	e9 56 fd ff ff       	jmpq   10065e <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
  100908:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  10090c:	e8 7c f8 ff ff       	callq  10018d <strlen>
  100911:	8b 7d 98             	mov    -0x68(%rbp),%edi
  100914:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
  100917:	44 89 e9             	mov    %r13d,%ecx
  10091a:	29 f9                	sub    %edi,%ecx
  10091c:	29 c1                	sub    %eax,%ecx
  10091e:	44 39 ea             	cmp    %r13d,%edx
  100921:	b8 00 00 00 00       	mov    $0x0,%eax
  100926:	0f 4d c8             	cmovge %eax,%ecx
  100929:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
  10092c:	e9 2d fd ff ff       	jmpq   10065e <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
  100931:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
  100934:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  100938:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  10093c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100942:	e9 96 fc ff ff       	jmpq   1005dd <printer_vprintf+0x35a>
        int flags = 0;
  100947:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  10094e:	e9 b0 f9 ff ff       	jmpq   100303 <printer_vprintf+0x80>
}
  100953:	48 83 c4 58          	add    $0x58,%rsp
  100957:	5b                   	pop    %rbx
  100958:	41 5c                	pop    %r12
  10095a:	41 5d                	pop    %r13
  10095c:	41 5e                	pop    %r14
  10095e:	41 5f                	pop    %r15
  100960:	5d                   	pop    %rbp
  100961:	c3                   	retq   

0000000000100962 <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  100962:	55                   	push   %rbp
  100963:	48 89 e5             	mov    %rsp,%rbp
  100966:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
  10096a:	48 c7 45 f0 6d 00 10 	movq   $0x10006d,-0x10(%rbp)
  100971:	00 
        cpos = 0;
  100972:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
  100978:	b8 00 00 00 00       	mov    $0x0,%eax
  10097d:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
  100980:	48 63 ff             	movslq %edi,%rdi
  100983:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
  10098a:	00 
  10098b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
  10098f:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
  100993:	e8 eb f8 ff ff       	callq  100283 <printer_vprintf>
    return cp.cursor - console;
  100998:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10099c:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  1009a2:	48 d1 f8             	sar    %rax
}
  1009a5:	c9                   	leaveq 
  1009a6:	c3                   	retq   

00000000001009a7 <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
  1009a7:	55                   	push   %rbp
  1009a8:	48 89 e5             	mov    %rsp,%rbp
  1009ab:	48 83 ec 50          	sub    $0x50,%rsp
  1009af:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1009b3:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1009b7:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
  1009bb:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  1009c2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1009c6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1009ca:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1009ce:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  1009d2:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1009d6:	e8 87 ff ff ff       	callq  100962 <console_vprintf>
}
  1009db:	c9                   	leaveq 
  1009dc:	c3                   	retq   

00000000001009dd <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
  1009dd:	55                   	push   %rbp
  1009de:	48 89 e5             	mov    %rsp,%rbp
  1009e1:	53                   	push   %rbx
  1009e2:	48 83 ec 28          	sub    $0x28,%rsp
  1009e6:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
  1009e9:	48 c7 45 d8 f3 00 10 	movq   $0x1000f3,-0x28(%rbp)
  1009f0:	00 
    sp.s = s;
  1009f1:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
  1009f5:	48 85 f6             	test   %rsi,%rsi
  1009f8:	75 0b                	jne    100a05 <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
  1009fa:	8b 45 e0             	mov    -0x20(%rbp),%eax
  1009fd:	29 d8                	sub    %ebx,%eax
}
  1009ff:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100a03:	c9                   	leaveq 
  100a04:	c3                   	retq   
        sp.end = s + size - 1;
  100a05:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
  100a0a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
  100a0e:	be 00 00 00 00       	mov    $0x0,%esi
  100a13:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  100a17:	e8 67 f8 ff ff       	callq  100283 <printer_vprintf>
        *sp.s = 0;
  100a1c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100a20:	c6 00 00             	movb   $0x0,(%rax)
  100a23:	eb d5                	jmp    1009fa <vsnprintf+0x1d>

0000000000100a25 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
  100a25:	55                   	push   %rbp
  100a26:	48 89 e5             	mov    %rsp,%rbp
  100a29:	48 83 ec 50          	sub    $0x50,%rsp
  100a2d:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100a31:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100a35:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100a39:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100a40:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100a44:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100a48:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100a4c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100a50:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100a54:	e8 84 ff ff ff       	callq  1009dd <vsnprintf>
    va_end(val);
    return n;
}
  100a59:	c9                   	leaveq 
  100a5a:	c3                   	retq   

0000000000100a5b <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  100a5b:	b8 00 80 0b 00       	mov    $0xb8000,%eax
  100a60:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
  100a65:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  100a6a:	48 83 c0 02          	add    $0x2,%rax
  100a6e:	48 39 d0             	cmp    %rdx,%rax
  100a71:	75 f2                	jne    100a65 <console_clear+0xa>
    }
    cursorpos = 0;
  100a73:	c7 05 7f 85 fb ff 00 	movl   $0x0,-0x47a81(%rip)        # b8ffc <cursorpos>
  100a7a:	00 00 00 
}
  100a7d:	c3                   	retq   

0000000000100a7e <app_printf>:
#include "process.h"

// app_printf
//     A version of console_printf that picks a sensible color by process ID.

void app_printf(int colorid, const char* format, ...) {
  100a7e:	55                   	push   %rbp
  100a7f:	48 89 e5             	mov    %rsp,%rbp
  100a82:	48 83 ec 50          	sub    $0x50,%rsp
  100a86:	49 89 f2             	mov    %rsi,%r10
  100a89:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  100a8d:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100a91:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100a95:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    int color;
    if (colorid < 0) {
        color = 0x0700;
  100a99:	be 00 07 00 00       	mov    $0x700,%esi
    if (colorid < 0) {
  100a9e:	85 ff                	test   %edi,%edi
  100aa0:	78 2e                	js     100ad0 <app_printf+0x52>
    } else {
        static const uint8_t col[] = { 0x0E, 0x0F, 0x0C, 0x0A, 0x09 };
        color = col[colorid % sizeof(col)] << 8;
  100aa2:	48 63 ff             	movslq %edi,%rdi
  100aa5:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
  100aac:	cc cc cc 
  100aaf:	48 89 f8             	mov    %rdi,%rax
  100ab2:	48 f7 e2             	mul    %rdx
  100ab5:	48 89 d0             	mov    %rdx,%rax
  100ab8:	48 c1 e8 02          	shr    $0x2,%rax
  100abc:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
  100ac0:	48 01 c2             	add    %rax,%rdx
  100ac3:	48 29 d7             	sub    %rdx,%rdi
  100ac6:	0f b6 b7 cd 0e 10 00 	movzbl 0x100ecd(%rdi),%esi
  100acd:	c1 e6 08             	shl    $0x8,%esi
    }

    va_list val;
    va_start(val, format);
  100ad0:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%rbp)
  100ad7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100adb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100adf:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100ae3:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cursorpos = console_vprintf(cursorpos, color, format, val);
  100ae7:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100aeb:	4c 89 d2             	mov    %r10,%rdx
  100aee:	8b 3d 08 85 fb ff    	mov    -0x47af8(%rip),%edi        # b8ffc <cursorpos>
  100af4:	e8 69 fe ff ff       	callq  100962 <console_vprintf>
    va_end(val);

    if (CROW(cursorpos) >= 23) {
        cursorpos = CPOS(0, 0);
  100af9:	3d 30 07 00 00       	cmp    $0x730,%eax
  100afe:	ba 00 00 00 00       	mov    $0x0,%edx
  100b03:	0f 4d c2             	cmovge %edx,%eax
  100b06:	89 05 f0 84 fb ff    	mov    %eax,-0x47b10(%rip)        # b8ffc <cursorpos>
    }
}
  100b0c:	c9                   	leaveq 
  100b0d:	c3                   	retq   

0000000000100b0e <panic>:


// panic, assert_fail
//     Call the INT_SYS_PANIC system call so the kernel loops until Control-C.

void panic(const char* format, ...) {
  100b0e:	55                   	push   %rbp
  100b0f:	48 89 e5             	mov    %rsp,%rbp
  100b12:	53                   	push   %rbx
  100b13:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  100b1a:	48 89 fb             	mov    %rdi,%rbx
  100b1d:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
  100b21:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  100b25:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  100b29:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
  100b2d:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
    va_list val;
    va_start(val, format);
  100b31:	c7 45 a8 08 00 00 00 	movl   $0x8,-0x58(%rbp)
  100b38:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100b3c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  100b40:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  100b44:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    char buf[160];
    memcpy(buf, "PANIC: ", 7);
  100b48:	ba 07 00 00 00       	mov    $0x7,%edx
  100b4d:	be 97 0e 10 00       	mov    $0x100e97,%esi
  100b52:	48 8d bd 08 ff ff ff 	lea    -0xf8(%rbp),%rdi
  100b59:	e8 ab f5 ff ff       	callq  100109 <memcpy>
    int len = vsnprintf(&buf[7], sizeof(buf) - 7, format, val) + 7;
  100b5e:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
  100b62:	48 89 da             	mov    %rbx,%rdx
  100b65:	be 99 00 00 00       	mov    $0x99,%esi
  100b6a:	48 8d bd 0f ff ff ff 	lea    -0xf1(%rbp),%rdi
  100b71:	e8 67 fe ff ff       	callq  1009dd <vsnprintf>
  100b76:	8d 50 07             	lea    0x7(%rax),%edx
    va_end(val);
    if (len > 0 && buf[len - 1] != '\n') {
  100b79:	85 d2                	test   %edx,%edx
  100b7b:	7e 0f                	jle    100b8c <panic+0x7e>
  100b7d:	83 c0 06             	add    $0x6,%eax
  100b80:	48 98                	cltq   
  100b82:	80 bc 05 08 ff ff ff 	cmpb   $0xa,-0xf8(%rbp,%rax,1)
  100b89:	0a 
  100b8a:	75 29                	jne    100bb5 <panic+0xa7>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
  100b8c:	48 8d 8d 08 ff ff ff 	lea    -0xf8(%rbp),%rcx
  100b93:	ba a1 0e 10 00       	mov    $0x100ea1,%edx
  100b98:	be 00 c0 00 00       	mov    $0xc000,%esi
  100b9d:	bf 30 07 00 00       	mov    $0x730,%edi
  100ba2:	b8 00 00 00 00       	mov    $0x0,%eax
  100ba7:	e8 fb fd ff ff       	callq  1009a7 <console_printf>
    asm volatile ("int %0" : /* no result */
  100bac:	bf 00 00 00 00       	mov    $0x0,%edi
  100bb1:	cd 30                	int    $0x30
 loop: goto loop;
  100bb3:	eb fe                	jmp    100bb3 <panic+0xa5>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
  100bb5:	48 63 c2             	movslq %edx,%rax
  100bb8:	81 fa 9f 00 00 00    	cmp    $0x9f,%edx
  100bbe:	0f 94 c2             	sete   %dl
  100bc1:	0f b6 d2             	movzbl %dl,%edx
  100bc4:	48 29 d0             	sub    %rdx,%rax
  100bc7:	48 8d bc 05 08 ff ff 	lea    -0xf8(%rbp,%rax,1),%rdi
  100bce:	ff 
  100bcf:	be 9f 0e 10 00       	mov    $0x100e9f,%esi
  100bd4:	e8 f2 f5 ff ff       	callq  1001cb <strcpy>
  100bd9:	eb b1                	jmp    100b8c <panic+0x7e>

0000000000100bdb <assert_fail>:
    sys_panic(NULL);
 spinloop: goto spinloop;       // should never get here
}

void assert_fail(const char* file, int line, const char* msg) {
  100bdb:	55                   	push   %rbp
  100bdc:	48 89 e5             	mov    %rsp,%rbp
  100bdf:	48 89 f9             	mov    %rdi,%rcx
  100be2:	41 89 f0             	mov    %esi,%r8d
  100be5:	49 89 d1             	mov    %rdx,%r9
    (void) console_printf(CPOS(23, 0), 0xC000,
  100be8:	ba a8 0e 10 00       	mov    $0x100ea8,%edx
  100bed:	be 00 c0 00 00       	mov    $0xc000,%esi
  100bf2:	bf 30 07 00 00       	mov    $0x730,%edi
  100bf7:	b8 00 00 00 00       	mov    $0x0,%eax
  100bfc:	e8 a6 fd ff ff       	callq  1009a7 <console_printf>
    asm volatile ("int %0" : /* no result */
  100c01:	bf 00 00 00 00       	mov    $0x0,%edi
  100c06:	cd 30                	int    $0x30
 loop: goto loop;
  100c08:	eb fe                	jmp    100c08 <assert_fail+0x2d>
