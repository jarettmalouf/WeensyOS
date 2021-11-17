
obj/p-test.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main>:
#include "lib.h"

#define N 30
extern uint8_t end[];

void process_main(void) {
  100000:	55                   	push   %rbp
  100001:	48 89 e5             	mov    %rsp,%rbp
  100004:	53                   	push   %rbx
  100005:	48 83 ec 28          	sub    $0x28,%rsp

// sys_getpid
//    Return current process ID.
static inline pid_t sys_getpid(void) {
    pid_t result;
    asm volatile ("int %1" : "=a" (result)
  100009:	cd 31                	int    $0x31
  10000b:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  10000d:	89 c7                	mov    %eax,%edi
  10000f:	e8 89 02 00 00       	callq  10029d <srand>

    vamapping pmap;
    uint8_t * heap_top = ROUNDUP((uint8_t*) end, PAGESIZE);
  100014:	ba 07 20 10 00       	mov    $0x102007,%edx
  100019:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  100020:	48 89 d6             	mov    %rdx,%rsi

    // test N times
    for(int i = 0 ; i < N ; i++){
  100023:	48 81 c2 00 e0 01 00 	add    $0x1e000,%rdx
        int x = sys_page_alloc(heap_top);
        if(x != 0)
            panic("Error, sys_page_alloc failed!");
        // lets make sure we write to the page and are able to read from it
        *heap_top = p;
        assert(*heap_top == p);
  10002a:	0f b6 cb             	movzbl %bl,%ecx
// looks up the virtual memory mapping for addr for the current process 
// and stores it inside map. [map, sizeof(vampping)) address should be 
// allocated, writable addresses to the process, otherwise syscall will 
// not write anything to the variable
static inline void sys_mapping(uintptr_t addr, void * map){
    asm volatile ("int %0" : /* no result */
  10002d:	4c 8d 45 d8          	lea    -0x28(%rbp),%r8
    asm volatile ("int %1" : "=a" (result)
  100031:	48 89 f7             	mov    %rsi,%rdi
  100034:	cd 33                	int    $0x33
        if(x != 0)
  100036:	85 c0                	test   %eax,%eax
  100038:	75 2c                	jne    100066 <process_main+0x66>
        *heap_top = p;
  10003a:	88 1e                	mov    %bl,(%rsi)
        assert(*heap_top == p);
  10003c:	39 cb                	cmp    %ecx,%ebx
  10003e:	75 35                	jne    100075 <process_main+0x75>
    asm volatile ("int %0" : /* no result */
  100040:	4c 89 c7             	mov    %r8,%rdi
  100043:	cd 36                	int    $0x36
        sys_mapping((uintptr_t)heap_top, &pmap);

        if(pmap.pa == (uintptr_t)heap_top)
  100045:	48 39 75 e0          	cmp    %rsi,-0x20(%rbp)
  100049:	74 3e                	je     100089 <process_main+0x89>
            panic("Error, sys page alloc not virtualized!");

        heap_top += PAGESIZE;
  10004b:	48 81 c6 00 10 00 00 	add    $0x1000,%rsi
    for(int i = 0 ; i < N ; i++){
  100052:	48 39 f2             	cmp    %rsi,%rdx
  100055:	75 da                	jne    100031 <process_main+0x31>
    }

    TEST_PASS();
  100057:	bf 76 0c 10 00       	mov    $0x100c76,%edi
  10005c:	b8 00 00 00 00       	mov    $0x0,%eax
  100061:	e8 d3 0a 00 00       	callq  100b39 <panic>
            panic("Error, sys_page_alloc failed!");
  100066:	bf 40 0c 10 00       	mov    $0x100c40,%edi
  10006b:	b8 00 00 00 00       	mov    $0x0,%eax
  100070:	e8 c4 0a 00 00       	callq  100b39 <panic>
        assert(*heap_top == p);
  100075:	ba 5e 0c 10 00       	mov    $0x100c5e,%edx
  10007a:	be 15 00 00 00       	mov    $0x15,%esi
  10007f:	bf 6d 0c 10 00       	mov    $0x100c6d,%edi
  100084:	e8 7d 0b 00 00       	callq  100c06 <assert_fail>
            panic("Error, sys page alloc not virtualized!");
  100089:	bf 90 0c 10 00       	mov    $0x100c90,%edi
  10008e:	b8 00 00 00 00       	mov    $0x0,%eax
  100093:	e8 a1 0a 00 00       	callq  100b39 <panic>

0000000000100098 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
  100098:	48 89 f9             	mov    %rdi,%rcx
  10009b:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  10009d:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
  1000a4:	00 
  1000a5:	72 08                	jb     1000af <console_putc+0x17>
        cp->cursor = console;
  1000a7:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
  1000ae:	00 
    }
    if (c == '\n') {
  1000af:	40 80 fe 0a          	cmp    $0xa,%sil
  1000b3:	74 16                	je     1000cb <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
  1000b5:	48 8b 41 08          	mov    0x8(%rcx),%rax
  1000b9:	48 8d 50 02          	lea    0x2(%rax),%rdx
  1000bd:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  1000c1:	40 0f b6 f6          	movzbl %sil,%esi
  1000c5:	09 fe                	or     %edi,%esi
  1000c7:	66 89 30             	mov    %si,(%rax)
    }
}
  1000ca:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
  1000cb:	4c 8b 41 08          	mov    0x8(%rcx),%r8
  1000cf:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
  1000d6:	4c 89 c6             	mov    %r8,%rsi
  1000d9:	48 d1 fe             	sar    %rsi
  1000dc:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  1000e3:	66 66 66 
  1000e6:	48 89 f0             	mov    %rsi,%rax
  1000e9:	48 f7 ea             	imul   %rdx
  1000ec:	48 c1 fa 05          	sar    $0x5,%rdx
  1000f0:	49 c1 f8 3f          	sar    $0x3f,%r8
  1000f4:	4c 29 c2             	sub    %r8,%rdx
  1000f7:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  1000fb:	48 c1 e2 04          	shl    $0x4,%rdx
  1000ff:	89 f0                	mov    %esi,%eax
  100101:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
  100103:	83 cf 20             	or     $0x20,%edi
  100106:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10010a:	48 8d 72 02          	lea    0x2(%rdx),%rsi
  10010e:	48 89 71 08          	mov    %rsi,0x8(%rcx)
  100112:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
  100115:	83 c0 01             	add    $0x1,%eax
  100118:	83 f8 50             	cmp    $0x50,%eax
  10011b:	75 e9                	jne    100106 <console_putc+0x6e>
  10011d:	c3                   	retq   

000000000010011e <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
  10011e:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100122:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  100126:	73 0b                	jae    100133 <string_putc+0x15>
        *sp->s++ = c;
  100128:	48 8d 50 01          	lea    0x1(%rax),%rdx
  10012c:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  100130:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
  100133:	c3                   	retq   

0000000000100134 <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
  100134:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  100137:	48 85 d2             	test   %rdx,%rdx
  10013a:	74 17                	je     100153 <memcpy+0x1f>
  10013c:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
  100141:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
  100146:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  10014a:	48 83 c1 01          	add    $0x1,%rcx
  10014e:	48 39 d1             	cmp    %rdx,%rcx
  100151:	75 ee                	jne    100141 <memcpy+0xd>
}
  100153:	c3                   	retq   

0000000000100154 <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
  100154:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
  100157:	48 39 fe             	cmp    %rdi,%rsi
  10015a:	72 1d                	jb     100179 <memmove+0x25>
        while (n-- > 0) {
  10015c:	b9 00 00 00 00       	mov    $0x0,%ecx
  100161:	48 85 d2             	test   %rdx,%rdx
  100164:	74 12                	je     100178 <memmove+0x24>
            *d++ = *s++;
  100166:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  10016a:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  10016e:	48 83 c1 01          	add    $0x1,%rcx
  100172:	48 39 ca             	cmp    %rcx,%rdx
  100175:	75 ef                	jne    100166 <memmove+0x12>
}
  100177:	c3                   	retq   
  100178:	c3                   	retq   
    if (s < d && s + n > d) {
  100179:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  10017d:	48 39 cf             	cmp    %rcx,%rdi
  100180:	73 da                	jae    10015c <memmove+0x8>
        while (n-- > 0) {
  100182:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  100186:	48 85 d2             	test   %rdx,%rdx
  100189:	74 ec                	je     100177 <memmove+0x23>
            *--d = *--s;
  10018b:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  10018f:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  100192:	48 83 e9 01          	sub    $0x1,%rcx
  100196:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  10019a:	75 ef                	jne    10018b <memmove+0x37>
  10019c:	c3                   	retq   

000000000010019d <memset>:
void* memset(void* v, int c, size_t n) {
  10019d:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  1001a0:	48 85 d2             	test   %rdx,%rdx
  1001a3:	74 12                	je     1001b7 <memset+0x1a>
  1001a5:	48 01 fa             	add    %rdi,%rdx
  1001a8:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
  1001ab:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  1001ae:	48 83 c1 01          	add    $0x1,%rcx
  1001b2:	48 39 ca             	cmp    %rcx,%rdx
  1001b5:	75 f4                	jne    1001ab <memset+0xe>
}
  1001b7:	c3                   	retq   

00000000001001b8 <strlen>:
    for (n = 0; *s != '\0'; ++s) {
  1001b8:	80 3f 00             	cmpb   $0x0,(%rdi)
  1001bb:	74 10                	je     1001cd <strlen+0x15>
  1001bd:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1001c2:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1001c6:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1001ca:	75 f6                	jne    1001c2 <strlen+0xa>
  1001cc:	c3                   	retq   
  1001cd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1001d2:	c3                   	retq   

00000000001001d3 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1001d3:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1001d6:	ba 00 00 00 00       	mov    $0x0,%edx
  1001db:	48 85 f6             	test   %rsi,%rsi
  1001de:	74 11                	je     1001f1 <strnlen+0x1e>
  1001e0:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1001e4:	74 0c                	je     1001f2 <strnlen+0x1f>
        ++n;
  1001e6:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1001ea:	48 39 d0             	cmp    %rdx,%rax
  1001ed:	75 f1                	jne    1001e0 <strnlen+0xd>
  1001ef:	eb 04                	jmp    1001f5 <strnlen+0x22>
  1001f1:	c3                   	retq   
  1001f2:	48 89 d0             	mov    %rdx,%rax
}
  1001f5:	c3                   	retq   

00000000001001f6 <strcpy>:
char* strcpy(char* dst, const char* src) {
  1001f6:	48 89 f8             	mov    %rdi,%rax
  1001f9:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
  1001fe:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
  100202:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
  100205:	48 83 c2 01          	add    $0x1,%rdx
  100209:	84 c9                	test   %cl,%cl
  10020b:	75 f1                	jne    1001fe <strcpy+0x8>
}
  10020d:	c3                   	retq   

000000000010020e <strcmp>:
    while (*a && *b && *a == *b) {
  10020e:	0f b6 07             	movzbl (%rdi),%eax
  100211:	84 c0                	test   %al,%al
  100213:	74 1a                	je     10022f <strcmp+0x21>
  100215:	0f b6 16             	movzbl (%rsi),%edx
  100218:	38 c2                	cmp    %al,%dl
  10021a:	75 13                	jne    10022f <strcmp+0x21>
  10021c:	84 d2                	test   %dl,%dl
  10021e:	74 0f                	je     10022f <strcmp+0x21>
        ++a, ++b;
  100220:	48 83 c7 01          	add    $0x1,%rdi
  100224:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
  100228:	0f b6 07             	movzbl (%rdi),%eax
  10022b:	84 c0                	test   %al,%al
  10022d:	75 e6                	jne    100215 <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
  10022f:	3a 06                	cmp    (%rsi),%al
  100231:	0f 97 c0             	seta   %al
  100234:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
  100237:	83 d8 00             	sbb    $0x0,%eax
}
  10023a:	c3                   	retq   

000000000010023b <strchr>:
    while (*s && *s != (char) c) {
  10023b:	0f b6 07             	movzbl (%rdi),%eax
  10023e:	84 c0                	test   %al,%al
  100240:	74 10                	je     100252 <strchr+0x17>
  100242:	40 38 f0             	cmp    %sil,%al
  100245:	74 18                	je     10025f <strchr+0x24>
        ++s;
  100247:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  10024b:	0f b6 07             	movzbl (%rdi),%eax
  10024e:	84 c0                	test   %al,%al
  100250:	75 f0                	jne    100242 <strchr+0x7>
        return NULL;
  100252:	40 84 f6             	test   %sil,%sil
  100255:	b8 00 00 00 00       	mov    $0x0,%eax
  10025a:	48 0f 44 c7          	cmove  %rdi,%rax
}
  10025e:	c3                   	retq   
  10025f:	48 89 f8             	mov    %rdi,%rax
  100262:	c3                   	retq   

0000000000100263 <rand>:
    if (!rand_seed_set) {
  100263:	83 3d 9a 0d 00 00 00 	cmpl   $0x0,0xd9a(%rip)        # 101004 <rand_seed_set>
  10026a:	74 1b                	je     100287 <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
  10026c:	69 05 8a 0d 00 00 0d 	imul   $0x19660d,0xd8a(%rip),%eax        # 101000 <rand_seed>
  100273:	66 19 00 
  100276:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  10027b:	89 05 7f 0d 00 00    	mov    %eax,0xd7f(%rip)        # 101000 <rand_seed>
    return rand_seed & RAND_MAX;
  100281:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  100286:	c3                   	retq   
    rand_seed = seed;
  100287:	c7 05 6f 0d 00 00 9e 	movl   $0x30d4879e,0xd6f(%rip)        # 101000 <rand_seed>
  10028e:	87 d4 30 
    rand_seed_set = 1;
  100291:	c7 05 69 0d 00 00 01 	movl   $0x1,0xd69(%rip)        # 101004 <rand_seed_set>
  100298:	00 00 00 
}
  10029b:	eb cf                	jmp    10026c <rand+0x9>

000000000010029d <srand>:
    rand_seed = seed;
  10029d:	89 3d 5d 0d 00 00    	mov    %edi,0xd5d(%rip)        # 101000 <rand_seed>
    rand_seed_set = 1;
  1002a3:	c7 05 57 0d 00 00 01 	movl   $0x1,0xd57(%rip)        # 101004 <rand_seed_set>
  1002aa:	00 00 00 
}
  1002ad:	c3                   	retq   

00000000001002ae <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
  1002ae:	55                   	push   %rbp
  1002af:	48 89 e5             	mov    %rsp,%rbp
  1002b2:	41 57                	push   %r15
  1002b4:	41 56                	push   %r14
  1002b6:	41 55                	push   %r13
  1002b8:	41 54                	push   %r12
  1002ba:	53                   	push   %rbx
  1002bb:	48 83 ec 58          	sub    $0x58,%rsp
  1002bf:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  1002c3:	0f b6 02             	movzbl (%rdx),%eax
  1002c6:	84 c0                	test   %al,%al
  1002c8:	0f 84 b0 06 00 00    	je     10097e <printer_vprintf+0x6d0>
  1002ce:	49 89 fe             	mov    %rdi,%r14
  1002d1:	49 89 d4             	mov    %rdx,%r12
            length = 1;
  1002d4:	41 89 f7             	mov    %esi,%r15d
  1002d7:	e9 a4 04 00 00       	jmpq   100780 <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
  1002dc:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1002e1:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1002e7:	45 84 e4             	test   %r12b,%r12b
  1002ea:	0f 84 82 06 00 00    	je     100972 <printer_vprintf+0x6c4>
        int flags = 0;
  1002f0:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  1002f6:	41 0f be f4          	movsbl %r12b,%esi
  1002fa:	bf c1 0e 10 00       	mov    $0x100ec1,%edi
  1002ff:	e8 37 ff ff ff       	callq  10023b <strchr>
  100304:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100307:	48 85 c0             	test   %rax,%rax
  10030a:	74 55                	je     100361 <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
  10030c:	48 81 e9 c1 0e 10 00 	sub    $0x100ec1,%rcx
  100313:	b8 01 00 00 00       	mov    $0x1,%eax
  100318:	d3 e0                	shl    %cl,%eax
  10031a:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  10031d:	48 83 c3 01          	add    $0x1,%rbx
  100321:	44 0f b6 23          	movzbl (%rbx),%r12d
  100325:	45 84 e4             	test   %r12b,%r12b
  100328:	75 cc                	jne    1002f6 <printer_vprintf+0x48>
  10032a:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
  10032e:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  100334:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
  10033b:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  10033e:	0f 84 a9 00 00 00    	je     1003ed <printer_vprintf+0x13f>
        int length = 0;
  100344:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
  100349:	0f b6 13             	movzbl (%rbx),%edx
  10034c:	8d 42 bd             	lea    -0x43(%rdx),%eax
  10034f:	3c 37                	cmp    $0x37,%al
  100351:	0f 87 c4 04 00 00    	ja     10081b <printer_vprintf+0x56d>
  100357:	0f b6 c0             	movzbl %al,%eax
  10035a:	ff 24 c5 d0 0c 10 00 	jmpq   *0x100cd0(,%rax,8)
        if (*format >= '1' && *format <= '9') {
  100361:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
  100365:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  10036a:	3c 08                	cmp    $0x8,%al
  10036c:	77 2f                	ja     10039d <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10036e:	0f b6 03             	movzbl (%rbx),%eax
  100371:	8d 50 d0             	lea    -0x30(%rax),%edx
  100374:	80 fa 09             	cmp    $0x9,%dl
  100377:	77 5e                	ja     1003d7 <printer_vprintf+0x129>
  100379:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  10037f:	48 83 c3 01          	add    $0x1,%rbx
  100383:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  100388:	0f be c0             	movsbl %al,%eax
  10038b:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100390:	0f b6 03             	movzbl (%rbx),%eax
  100393:	8d 50 d0             	lea    -0x30(%rax),%edx
  100396:	80 fa 09             	cmp    $0x9,%dl
  100399:	76 e4                	jbe    10037f <printer_vprintf+0xd1>
  10039b:	eb 97                	jmp    100334 <printer_vprintf+0x86>
        } else if (*format == '*') {
  10039d:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1003a1:	75 3f                	jne    1003e2 <printer_vprintf+0x134>
            width = va_arg(val, int);
  1003a3:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1003a7:	8b 07                	mov    (%rdi),%eax
  1003a9:	83 f8 2f             	cmp    $0x2f,%eax
  1003ac:	77 17                	ja     1003c5 <printer_vprintf+0x117>
  1003ae:	89 c2                	mov    %eax,%edx
  1003b0:	48 03 57 10          	add    0x10(%rdi),%rdx
  1003b4:	83 c0 08             	add    $0x8,%eax
  1003b7:	89 07                	mov    %eax,(%rdi)
  1003b9:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  1003bc:	48 83 c3 01          	add    $0x1,%rbx
  1003c0:	e9 6f ff ff ff       	jmpq   100334 <printer_vprintf+0x86>
            width = va_arg(val, int);
  1003c5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1003c9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1003cd:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1003d1:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1003d5:	eb e2                	jmp    1003b9 <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1003d7:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1003dd:	e9 52 ff ff ff       	jmpq   100334 <printer_vprintf+0x86>
        int width = -1;
  1003e2:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1003e8:	e9 47 ff ff ff       	jmpq   100334 <printer_vprintf+0x86>
            ++format;
  1003ed:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1003f1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1003f5:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1003f8:	80 f9 09             	cmp    $0x9,%cl
  1003fb:	76 13                	jbe    100410 <printer_vprintf+0x162>
            } else if (*format == '*') {
  1003fd:	3c 2a                	cmp    $0x2a,%al
  1003ff:	74 33                	je     100434 <printer_vprintf+0x186>
            ++format;
  100401:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  100404:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
  10040b:	e9 34 ff ff ff       	jmpq   100344 <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100410:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  100415:	48 83 c2 01          	add    $0x1,%rdx
  100419:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  10041c:	0f be c0             	movsbl %al,%eax
  10041f:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100423:	0f b6 02             	movzbl (%rdx),%eax
  100426:	8d 70 d0             	lea    -0x30(%rax),%esi
  100429:	40 80 fe 09          	cmp    $0x9,%sil
  10042d:	76 e6                	jbe    100415 <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
  10042f:	48 89 d3             	mov    %rdx,%rbx
  100432:	eb 1c                	jmp    100450 <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
  100434:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100438:	8b 07                	mov    (%rdi),%eax
  10043a:	83 f8 2f             	cmp    $0x2f,%eax
  10043d:	77 23                	ja     100462 <printer_vprintf+0x1b4>
  10043f:	89 c2                	mov    %eax,%edx
  100441:	48 03 57 10          	add    0x10(%rdi),%rdx
  100445:	83 c0 08             	add    $0x8,%eax
  100448:	89 07                	mov    %eax,(%rdi)
  10044a:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  10044c:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  100450:	85 c9                	test   %ecx,%ecx
  100452:	b8 00 00 00 00       	mov    $0x0,%eax
  100457:	0f 49 c1             	cmovns %ecx,%eax
  10045a:	89 45 9c             	mov    %eax,-0x64(%rbp)
  10045d:	e9 e2 fe ff ff       	jmpq   100344 <printer_vprintf+0x96>
                precision = va_arg(val, int);
  100462:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100466:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10046a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10046e:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100472:	eb d6                	jmp    10044a <printer_vprintf+0x19c>
        switch (*format) {
  100474:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  100479:	e9 f3 00 00 00       	jmpq   100571 <printer_vprintf+0x2c3>
            ++format;
  10047e:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
  100482:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
  100487:	e9 bd fe ff ff       	jmpq   100349 <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10048c:	85 c9                	test   %ecx,%ecx
  10048e:	74 55                	je     1004e5 <printer_vprintf+0x237>
  100490:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100494:	8b 07                	mov    (%rdi),%eax
  100496:	83 f8 2f             	cmp    $0x2f,%eax
  100499:	77 38                	ja     1004d3 <printer_vprintf+0x225>
  10049b:	89 c2                	mov    %eax,%edx
  10049d:	48 03 57 10          	add    0x10(%rdi),%rdx
  1004a1:	83 c0 08             	add    $0x8,%eax
  1004a4:	89 07                	mov    %eax,(%rdi)
  1004a6:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1004a9:	48 89 d0             	mov    %rdx,%rax
  1004ac:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  1004b0:	49 89 d0             	mov    %rdx,%r8
  1004b3:	49 f7 d8             	neg    %r8
  1004b6:	25 80 00 00 00       	and    $0x80,%eax
  1004bb:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1004bf:	0b 45 a8             	or     -0x58(%rbp),%eax
  1004c2:	83 c8 60             	or     $0x60,%eax
  1004c5:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
  1004c8:	41 bc d0 0e 10 00    	mov    $0x100ed0,%r12d
            break;
  1004ce:	e9 35 01 00 00       	jmpq   100608 <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1004d3:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004d7:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1004db:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004df:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1004e3:	eb c1                	jmp    1004a6 <printer_vprintf+0x1f8>
  1004e5:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004e9:	8b 07                	mov    (%rdi),%eax
  1004eb:	83 f8 2f             	cmp    $0x2f,%eax
  1004ee:	77 10                	ja     100500 <printer_vprintf+0x252>
  1004f0:	89 c2                	mov    %eax,%edx
  1004f2:	48 03 57 10          	add    0x10(%rdi),%rdx
  1004f6:	83 c0 08             	add    $0x8,%eax
  1004f9:	89 07                	mov    %eax,(%rdi)
  1004fb:	48 63 12             	movslq (%rdx),%rdx
  1004fe:	eb a9                	jmp    1004a9 <printer_vprintf+0x1fb>
  100500:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100504:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100508:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10050c:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100510:	eb e9                	jmp    1004fb <printer_vprintf+0x24d>
        int base = 10;
  100512:	be 0a 00 00 00       	mov    $0xa,%esi
  100517:	eb 58                	jmp    100571 <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100519:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10051d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100521:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100525:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100529:	eb 60                	jmp    10058b <printer_vprintf+0x2dd>
  10052b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10052f:	8b 07                	mov    (%rdi),%eax
  100531:	83 f8 2f             	cmp    $0x2f,%eax
  100534:	77 10                	ja     100546 <printer_vprintf+0x298>
  100536:	89 c2                	mov    %eax,%edx
  100538:	48 03 57 10          	add    0x10(%rdi),%rdx
  10053c:	83 c0 08             	add    $0x8,%eax
  10053f:	89 07                	mov    %eax,(%rdi)
  100541:	44 8b 02             	mov    (%rdx),%r8d
  100544:	eb 48                	jmp    10058e <printer_vprintf+0x2e0>
  100546:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10054a:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10054e:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100552:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100556:	eb e9                	jmp    100541 <printer_vprintf+0x293>
  100558:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  10055b:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
  100562:	bf b0 0e 10 00       	mov    $0x100eb0,%edi
  100567:	e9 e2 02 00 00       	jmpq   10084e <printer_vprintf+0x5a0>
            base = 16;
  10056c:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100571:	85 c9                	test   %ecx,%ecx
  100573:	74 b6                	je     10052b <printer_vprintf+0x27d>
  100575:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100579:	8b 01                	mov    (%rcx),%eax
  10057b:	83 f8 2f             	cmp    $0x2f,%eax
  10057e:	77 99                	ja     100519 <printer_vprintf+0x26b>
  100580:	89 c2                	mov    %eax,%edx
  100582:	48 03 51 10          	add    0x10(%rcx),%rdx
  100586:	83 c0 08             	add    $0x8,%eax
  100589:	89 01                	mov    %eax,(%rcx)
  10058b:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  10058e:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
  100592:	85 f6                	test   %esi,%esi
  100594:	79 c2                	jns    100558 <printer_vprintf+0x2aa>
        base = -base;
  100596:	41 89 f1             	mov    %esi,%r9d
  100599:	f7 de                	neg    %esi
  10059b:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
  1005a2:	bf 90 0e 10 00       	mov    $0x100e90,%edi
  1005a7:	e9 a2 02 00 00       	jmpq   10084e <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
  1005ac:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1005b0:	8b 07                	mov    (%rdi),%eax
  1005b2:	83 f8 2f             	cmp    $0x2f,%eax
  1005b5:	77 1c                	ja     1005d3 <printer_vprintf+0x325>
  1005b7:	89 c2                	mov    %eax,%edx
  1005b9:	48 03 57 10          	add    0x10(%rdi),%rdx
  1005bd:	83 c0 08             	add    $0x8,%eax
  1005c0:	89 07                	mov    %eax,(%rdi)
  1005c2:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1005c5:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
  1005cc:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  1005d1:	eb c3                	jmp    100596 <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
  1005d3:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005d7:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1005db:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005df:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1005e3:	eb dd                	jmp    1005c2 <printer_vprintf+0x314>
            data = va_arg(val, char*);
  1005e5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005e9:	8b 01                	mov    (%rcx),%eax
  1005eb:	83 f8 2f             	cmp    $0x2f,%eax
  1005ee:	0f 87 a5 01 00 00    	ja     100799 <printer_vprintf+0x4eb>
  1005f4:	89 c2                	mov    %eax,%edx
  1005f6:	48 03 51 10          	add    0x10(%rcx),%rdx
  1005fa:	83 c0 08             	add    $0x8,%eax
  1005fd:	89 01                	mov    %eax,(%rcx)
  1005ff:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
  100602:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
  100608:	8b 45 a8             	mov    -0x58(%rbp),%eax
  10060b:	83 e0 20             	and    $0x20,%eax
  10060e:	89 45 8c             	mov    %eax,-0x74(%rbp)
  100611:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100617:	0f 85 21 02 00 00    	jne    10083e <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  10061d:	8b 45 a8             	mov    -0x58(%rbp),%eax
  100620:	89 45 88             	mov    %eax,-0x78(%rbp)
  100623:	83 e0 60             	and    $0x60,%eax
  100626:	83 f8 60             	cmp    $0x60,%eax
  100629:	0f 84 54 02 00 00    	je     100883 <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  10062f:	8b 45 a8             	mov    -0x58(%rbp),%eax
  100632:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  100635:	48 c7 45 a0 d0 0e 10 	movq   $0x100ed0,-0x60(%rbp)
  10063c:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  10063d:	83 f8 21             	cmp    $0x21,%eax
  100640:	0f 84 79 02 00 00    	je     1008bf <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100646:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100649:	89 f8                	mov    %edi,%eax
  10064b:	f7 d0                	not    %eax
  10064d:	c1 e8 1f             	shr    $0x1f,%eax
  100650:	89 45 84             	mov    %eax,-0x7c(%rbp)
  100653:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
  100657:	0f 85 9e 02 00 00    	jne    1008fb <printer_vprintf+0x64d>
  10065d:	84 c0                	test   %al,%al
  10065f:	0f 84 96 02 00 00    	je     1008fb <printer_vprintf+0x64d>
            len = strnlen(data, precision);
  100665:	48 63 f7             	movslq %edi,%rsi
  100668:	4c 89 e7             	mov    %r12,%rdi
  10066b:	e8 63 fb ff ff       	callq  1001d3 <strnlen>
  100670:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
  100673:	8b 45 88             	mov    -0x78(%rbp),%eax
  100676:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
  100679:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
  100680:	83 f8 22             	cmp    $0x22,%eax
  100683:	0f 84 aa 02 00 00    	je     100933 <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
  100689:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  10068d:	e8 26 fb ff ff       	callq  1001b8 <strlen>
  100692:	8b 55 9c             	mov    -0x64(%rbp),%edx
  100695:	03 55 98             	add    -0x68(%rbp),%edx
  100698:	44 89 e9             	mov    %r13d,%ecx
  10069b:	29 d1                	sub    %edx,%ecx
  10069d:	29 c1                	sub    %eax,%ecx
  10069f:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
  1006a2:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1006a5:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
  1006a9:	75 2d                	jne    1006d8 <printer_vprintf+0x42a>
  1006ab:	85 c9                	test   %ecx,%ecx
  1006ad:	7e 29                	jle    1006d8 <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
  1006af:	44 89 fa             	mov    %r15d,%edx
  1006b2:	be 20 00 00 00       	mov    $0x20,%esi
  1006b7:	4c 89 f7             	mov    %r14,%rdi
  1006ba:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1006bd:	41 83 ed 01          	sub    $0x1,%r13d
  1006c1:	45 85 ed             	test   %r13d,%r13d
  1006c4:	7f e9                	jg     1006af <printer_vprintf+0x401>
  1006c6:	8b 7d 8c             	mov    -0x74(%rbp),%edi
  1006c9:	85 ff                	test   %edi,%edi
  1006cb:	b8 01 00 00 00       	mov    $0x1,%eax
  1006d0:	0f 4f c7             	cmovg  %edi,%eax
  1006d3:	29 c7                	sub    %eax,%edi
  1006d5:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
  1006d8:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  1006dc:	0f b6 07             	movzbl (%rdi),%eax
  1006df:	84 c0                	test   %al,%al
  1006e1:	74 22                	je     100705 <printer_vprintf+0x457>
  1006e3:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006e7:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
  1006ea:	0f b6 f0             	movzbl %al,%esi
  1006ed:	44 89 fa             	mov    %r15d,%edx
  1006f0:	4c 89 f7             	mov    %r14,%rdi
  1006f3:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
  1006f6:	48 83 c3 01          	add    $0x1,%rbx
  1006fa:	0f b6 03             	movzbl (%rbx),%eax
  1006fd:	84 c0                	test   %al,%al
  1006ff:	75 e9                	jne    1006ea <printer_vprintf+0x43c>
  100701:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
  100705:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100708:	85 c0                	test   %eax,%eax
  10070a:	7e 1d                	jle    100729 <printer_vprintf+0x47b>
  10070c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100710:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
  100712:	44 89 fa             	mov    %r15d,%edx
  100715:	be 30 00 00 00       	mov    $0x30,%esi
  10071a:	4c 89 f7             	mov    %r14,%rdi
  10071d:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
  100720:	83 eb 01             	sub    $0x1,%ebx
  100723:	75 ed                	jne    100712 <printer_vprintf+0x464>
  100725:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
  100729:	8b 45 98             	mov    -0x68(%rbp),%eax
  10072c:	85 c0                	test   %eax,%eax
  10072e:	7e 27                	jle    100757 <printer_vprintf+0x4a9>
  100730:	89 c0                	mov    %eax,%eax
  100732:	4c 01 e0             	add    %r12,%rax
  100735:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100739:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
  10073c:	41 0f b6 34 24       	movzbl (%r12),%esi
  100741:	44 89 fa             	mov    %r15d,%edx
  100744:	4c 89 f7             	mov    %r14,%rdi
  100747:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
  10074a:	49 83 c4 01          	add    $0x1,%r12
  10074e:	49 39 dc             	cmp    %rbx,%r12
  100751:	75 e9                	jne    10073c <printer_vprintf+0x48e>
  100753:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
  100757:	45 85 ed             	test   %r13d,%r13d
  10075a:	7e 14                	jle    100770 <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
  10075c:	44 89 fa             	mov    %r15d,%edx
  10075f:	be 20 00 00 00       	mov    $0x20,%esi
  100764:	4c 89 f7             	mov    %r14,%rdi
  100767:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
  10076a:	41 83 ed 01          	sub    $0x1,%r13d
  10076e:	75 ec                	jne    10075c <printer_vprintf+0x4ae>
    for (; *format; ++format) {
  100770:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  100774:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100778:	84 c0                	test   %al,%al
  10077a:	0f 84 fe 01 00 00    	je     10097e <printer_vprintf+0x6d0>
        if (*format != '%') {
  100780:	3c 25                	cmp    $0x25,%al
  100782:	0f 84 54 fb ff ff    	je     1002dc <printer_vprintf+0x2e>
            p->putc(p, *format, color);
  100788:	0f b6 f0             	movzbl %al,%esi
  10078b:	44 89 fa             	mov    %r15d,%edx
  10078e:	4c 89 f7             	mov    %r14,%rdi
  100791:	41 ff 16             	callq  *(%r14)
            continue;
  100794:	4c 89 e3             	mov    %r12,%rbx
  100797:	eb d7                	jmp    100770 <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
  100799:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10079d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1007a1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007a5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007a9:	e9 51 fe ff ff       	jmpq   1005ff <printer_vprintf+0x351>
            color = va_arg(val, int);
  1007ae:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1007b2:	8b 07                	mov    (%rdi),%eax
  1007b4:	83 f8 2f             	cmp    $0x2f,%eax
  1007b7:	77 10                	ja     1007c9 <printer_vprintf+0x51b>
  1007b9:	89 c2                	mov    %eax,%edx
  1007bb:	48 03 57 10          	add    0x10(%rdi),%rdx
  1007bf:	83 c0 08             	add    $0x8,%eax
  1007c2:	89 07                	mov    %eax,(%rdi)
  1007c4:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
  1007c7:	eb a7                	jmp    100770 <printer_vprintf+0x4c2>
            color = va_arg(val, int);
  1007c9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007cd:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007d1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007d5:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007d9:	eb e9                	jmp    1007c4 <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
  1007db:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007df:	8b 01                	mov    (%rcx),%eax
  1007e1:	83 f8 2f             	cmp    $0x2f,%eax
  1007e4:	77 23                	ja     100809 <printer_vprintf+0x55b>
  1007e6:	89 c2                	mov    %eax,%edx
  1007e8:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007ec:	83 c0 08             	add    $0x8,%eax
  1007ef:	89 01                	mov    %eax,(%rcx)
  1007f1:	8b 02                	mov    (%rdx),%eax
  1007f3:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1007f6:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1007fa:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  1007fe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  100804:	e9 ff fd ff ff       	jmpq   100608 <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
  100809:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10080d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100811:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100815:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100819:	eb d6                	jmp    1007f1 <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
  10081b:	84 d2                	test   %dl,%dl
  10081d:	0f 85 39 01 00 00    	jne    10095c <printer_vprintf+0x6ae>
  100823:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  100827:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  10082b:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
  10082f:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  100833:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100839:	e9 ca fd ff ff       	jmpq   100608 <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
  10083e:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  100844:	bf b0 0e 10 00       	mov    $0x100eb0,%edi
        if (flags & FLAG_NUMERIC) {
  100849:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  10084e:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  100852:	4c 89 c1             	mov    %r8,%rcx
  100855:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
  100859:	48 63 f6             	movslq %esi,%rsi
  10085c:	49 83 ec 01          	sub    $0x1,%r12
  100860:	48 89 c8             	mov    %rcx,%rax
  100863:	ba 00 00 00 00       	mov    $0x0,%edx
  100868:	48 f7 f6             	div    %rsi
  10086b:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  10086f:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
  100873:	48 89 ca             	mov    %rcx,%rdx
  100876:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  100879:	48 39 d6             	cmp    %rdx,%rsi
  10087c:	76 de                	jbe    10085c <printer_vprintf+0x5ae>
  10087e:	e9 9a fd ff ff       	jmpq   10061d <printer_vprintf+0x36f>
                prefix = "-";
  100883:	48 c7 45 a0 bc 0c 10 	movq   $0x100cbc,-0x60(%rbp)
  10088a:	00 
            if (flags & FLAG_NEGATIVE) {
  10088b:	8b 45 a8             	mov    -0x58(%rbp),%eax
  10088e:	a8 80                	test   $0x80,%al
  100890:	0f 85 b0 fd ff ff    	jne    100646 <printer_vprintf+0x398>
                prefix = "+";
  100896:	48 c7 45 a0 b7 0c 10 	movq   $0x100cb7,-0x60(%rbp)
  10089d:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  10089e:	a8 10                	test   $0x10,%al
  1008a0:	0f 85 a0 fd ff ff    	jne    100646 <printer_vprintf+0x398>
                prefix = " ";
  1008a6:	a8 08                	test   $0x8,%al
  1008a8:	ba d0 0e 10 00       	mov    $0x100ed0,%edx
  1008ad:	b8 cd 0e 10 00       	mov    $0x100ecd,%eax
  1008b2:	48 0f 44 c2          	cmove  %rdx,%rax
  1008b6:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  1008ba:	e9 87 fd ff ff       	jmpq   100646 <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
  1008bf:	41 8d 41 10          	lea    0x10(%r9),%eax
  1008c3:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1008c8:	0f 85 78 fd ff ff    	jne    100646 <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
  1008ce:	4d 85 c0             	test   %r8,%r8
  1008d1:	75 0d                	jne    1008e0 <printer_vprintf+0x632>
  1008d3:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
  1008da:	0f 84 66 fd ff ff    	je     100646 <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
  1008e0:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  1008e4:	ba be 0c 10 00       	mov    $0x100cbe,%edx
  1008e9:	b8 b9 0c 10 00       	mov    $0x100cb9,%eax
  1008ee:	48 0f 44 c2          	cmove  %rdx,%rax
  1008f2:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  1008f6:	e9 4b fd ff ff       	jmpq   100646 <printer_vprintf+0x398>
            len = strlen(data);
  1008fb:	4c 89 e7             	mov    %r12,%rdi
  1008fe:	e8 b5 f8 ff ff       	callq  1001b8 <strlen>
  100903:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
  100906:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
  10090a:	0f 84 63 fd ff ff    	je     100673 <printer_vprintf+0x3c5>
  100910:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
  100914:	0f 84 59 fd ff ff    	je     100673 <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
  10091a:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  10091d:	89 ca                	mov    %ecx,%edx
  10091f:	29 c2                	sub    %eax,%edx
  100921:	39 c1                	cmp    %eax,%ecx
  100923:	b8 00 00 00 00       	mov    $0x0,%eax
  100928:	0f 4e d0             	cmovle %eax,%edx
  10092b:	89 55 9c             	mov    %edx,-0x64(%rbp)
  10092e:	e9 56 fd ff ff       	jmpq   100689 <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
  100933:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
  100937:	e8 7c f8 ff ff       	callq  1001b8 <strlen>
  10093c:	8b 7d 98             	mov    -0x68(%rbp),%edi
  10093f:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
  100942:	44 89 e9             	mov    %r13d,%ecx
  100945:	29 f9                	sub    %edi,%ecx
  100947:	29 c1                	sub    %eax,%ecx
  100949:	44 39 ea             	cmp    %r13d,%edx
  10094c:	b8 00 00 00 00       	mov    $0x0,%eax
  100951:	0f 4d c8             	cmovge %eax,%ecx
  100954:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
  100957:	e9 2d fd ff ff       	jmpq   100689 <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
  10095c:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
  10095f:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  100963:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
  100967:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  10096d:	e9 96 fc ff ff       	jmpq   100608 <printer_vprintf+0x35a>
        int flags = 0;
  100972:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
  100979:	e9 b0 f9 ff ff       	jmpq   10032e <printer_vprintf+0x80>
}
  10097e:	48 83 c4 58          	add    $0x58,%rsp
  100982:	5b                   	pop    %rbx
  100983:	41 5c                	pop    %r12
  100985:	41 5d                	pop    %r13
  100987:	41 5e                	pop    %r14
  100989:	41 5f                	pop    %r15
  10098b:	5d                   	pop    %rbp
  10098c:	c3                   	retq   

000000000010098d <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  10098d:	55                   	push   %rbp
  10098e:	48 89 e5             	mov    %rsp,%rbp
  100991:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
  100995:	48 c7 45 f0 98 00 10 	movq   $0x100098,-0x10(%rbp)
  10099c:	00 
        cpos = 0;
  10099d:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
  1009a3:	b8 00 00 00 00       	mov    $0x0,%eax
  1009a8:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
  1009ab:	48 63 ff             	movslq %edi,%rdi
  1009ae:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
  1009b5:	00 
  1009b6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
  1009ba:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
  1009be:	e8 eb f8 ff ff       	callq  1002ae <printer_vprintf>
    return cp.cursor - console;
  1009c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1009c7:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  1009cd:	48 d1 f8             	sar    %rax
}
  1009d0:	c9                   	leaveq 
  1009d1:	c3                   	retq   

00000000001009d2 <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
  1009d2:	55                   	push   %rbp
  1009d3:	48 89 e5             	mov    %rsp,%rbp
  1009d6:	48 83 ec 50          	sub    $0x50,%rsp
  1009da:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1009de:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1009e2:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
  1009e6:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  1009ed:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1009f1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1009f5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1009f9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  1009fd:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100a01:	e8 87 ff ff ff       	callq  10098d <console_vprintf>
}
  100a06:	c9                   	leaveq 
  100a07:	c3                   	retq   

0000000000100a08 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100a08:	55                   	push   %rbp
  100a09:	48 89 e5             	mov    %rsp,%rbp
  100a0c:	53                   	push   %rbx
  100a0d:	48 83 ec 28          	sub    $0x28,%rsp
  100a11:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
  100a14:	48 c7 45 d8 1e 01 10 	movq   $0x10011e,-0x28(%rbp)
  100a1b:	00 
    sp.s = s;
  100a1c:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
  100a20:	48 85 f6             	test   %rsi,%rsi
  100a23:	75 0b                	jne    100a30 <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
  100a25:	8b 45 e0             	mov    -0x20(%rbp),%eax
  100a28:	29 d8                	sub    %ebx,%eax
}
  100a2a:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100a2e:	c9                   	leaveq 
  100a2f:	c3                   	retq   
        sp.end = s + size - 1;
  100a30:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
  100a35:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
  100a39:	be 00 00 00 00       	mov    $0x0,%esi
  100a3e:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  100a42:	e8 67 f8 ff ff       	callq  1002ae <printer_vprintf>
        *sp.s = 0;
  100a47:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100a4b:	c6 00 00             	movb   $0x0,(%rax)
  100a4e:	eb d5                	jmp    100a25 <vsnprintf+0x1d>

0000000000100a50 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
  100a50:	55                   	push   %rbp
  100a51:	48 89 e5             	mov    %rsp,%rbp
  100a54:	48 83 ec 50          	sub    $0x50,%rsp
  100a58:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100a5c:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100a60:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100a64:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100a6b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100a6f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100a73:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100a77:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100a7b:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100a7f:	e8 84 ff ff ff       	callq  100a08 <vsnprintf>
    va_end(val);
    return n;
}
  100a84:	c9                   	leaveq 
  100a85:	c3                   	retq   

0000000000100a86 <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  100a86:	b8 00 80 0b 00       	mov    $0xb8000,%eax
  100a8b:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
  100a90:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  100a95:	48 83 c0 02          	add    $0x2,%rax
  100a99:	48 39 d0             	cmp    %rdx,%rax
  100a9c:	75 f2                	jne    100a90 <console_clear+0xa>
    }
    cursorpos = 0;
  100a9e:	c7 05 54 85 fb ff 00 	movl   $0x0,-0x47aac(%rip)        # b8ffc <cursorpos>
  100aa5:	00 00 00 
}
  100aa8:	c3                   	retq   

0000000000100aa9 <app_printf>:
#include "process.h"

// app_printf
//     A version of console_printf that picks a sensible color by process ID.

void app_printf(int colorid, const char* format, ...) {
  100aa9:	55                   	push   %rbp
  100aaa:	48 89 e5             	mov    %rsp,%rbp
  100aad:	48 83 ec 50          	sub    $0x50,%rsp
  100ab1:	49 89 f2             	mov    %rsi,%r10
  100ab4:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  100ab8:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100abc:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100ac0:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    int color;
    if (colorid < 0) {
        color = 0x0700;
  100ac4:	be 00 07 00 00       	mov    $0x700,%esi
    if (colorid < 0) {
  100ac9:	85 ff                	test   %edi,%edi
  100acb:	78 2e                	js     100afb <app_printf+0x52>
    } else {
        static const uint8_t col[] = { 0x0E, 0x0F, 0x0C, 0x0A, 0x09 };
        color = col[colorid % sizeof(col)] << 8;
  100acd:	48 63 ff             	movslq %edi,%rdi
  100ad0:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
  100ad7:	cc cc cc 
  100ada:	48 89 f8             	mov    %rdi,%rax
  100add:	48 f7 e2             	mul    %rdx
  100ae0:	48 89 d0             	mov    %rdx,%rax
  100ae3:	48 c1 e8 02          	shr    $0x2,%rax
  100ae7:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
  100aeb:	48 01 c2             	add    %rax,%rdx
  100aee:	48 29 d7             	sub    %rdx,%rdi
  100af1:	0f b6 b7 fd 0e 10 00 	movzbl 0x100efd(%rdi),%esi
  100af8:	c1 e6 08             	shl    $0x8,%esi
    }

    va_list val;
    va_start(val, format);
  100afb:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%rbp)
  100b02:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100b06:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100b0a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100b0e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cursorpos = console_vprintf(cursorpos, color, format, val);
  100b12:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100b16:	4c 89 d2             	mov    %r10,%rdx
  100b19:	8b 3d dd 84 fb ff    	mov    -0x47b23(%rip),%edi        # b8ffc <cursorpos>
  100b1f:	e8 69 fe ff ff       	callq  10098d <console_vprintf>
    va_end(val);

    if (CROW(cursorpos) >= 23) {
        cursorpos = CPOS(0, 0);
  100b24:	3d 30 07 00 00       	cmp    $0x730,%eax
  100b29:	ba 00 00 00 00       	mov    $0x0,%edx
  100b2e:	0f 4d c2             	cmovge %edx,%eax
  100b31:	89 05 c5 84 fb ff    	mov    %eax,-0x47b3b(%rip)        # b8ffc <cursorpos>
    }
}
  100b37:	c9                   	leaveq 
  100b38:	c3                   	retq   

0000000000100b39 <panic>:


// panic, assert_fail
//     Call the INT_SYS_PANIC system call so the kernel loops until Control-C.

void panic(const char* format, ...) {
  100b39:	55                   	push   %rbp
  100b3a:	48 89 e5             	mov    %rsp,%rbp
  100b3d:	53                   	push   %rbx
  100b3e:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  100b45:	48 89 fb             	mov    %rdi,%rbx
  100b48:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
  100b4c:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  100b50:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  100b54:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
  100b58:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
    va_list val;
    va_start(val, format);
  100b5c:	c7 45 a8 08 00 00 00 	movl   $0x8,-0x58(%rbp)
  100b63:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100b67:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  100b6b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  100b6f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    char buf[160];
    memcpy(buf, "PANIC: ", 7);
  100b73:	ba 07 00 00 00       	mov    $0x7,%edx
  100b78:	be c7 0e 10 00       	mov    $0x100ec7,%esi
  100b7d:	48 8d bd 08 ff ff ff 	lea    -0xf8(%rbp),%rdi
  100b84:	e8 ab f5 ff ff       	callq  100134 <memcpy>
    int len = vsnprintf(&buf[7], sizeof(buf) - 7, format, val) + 7;
  100b89:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
  100b8d:	48 89 da             	mov    %rbx,%rdx
  100b90:	be 99 00 00 00       	mov    $0x99,%esi
  100b95:	48 8d bd 0f ff ff ff 	lea    -0xf1(%rbp),%rdi
  100b9c:	e8 67 fe ff ff       	callq  100a08 <vsnprintf>
  100ba1:	8d 50 07             	lea    0x7(%rax),%edx
    va_end(val);
    if (len > 0 && buf[len - 1] != '\n') {
  100ba4:	85 d2                	test   %edx,%edx
  100ba6:	7e 0f                	jle    100bb7 <panic+0x7e>
  100ba8:	83 c0 06             	add    $0x6,%eax
  100bab:	48 98                	cltq   
  100bad:	80 bc 05 08 ff ff ff 	cmpb   $0xa,-0xf8(%rbp,%rax,1)
  100bb4:	0a 
  100bb5:	75 29                	jne    100be0 <panic+0xa7>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
  100bb7:	48 8d 8d 08 ff ff ff 	lea    -0xf8(%rbp),%rcx
  100bbe:	ba d1 0e 10 00       	mov    $0x100ed1,%edx
  100bc3:	be 00 c0 00 00       	mov    $0xc000,%esi
  100bc8:	bf 30 07 00 00       	mov    $0x730,%edi
  100bcd:	b8 00 00 00 00       	mov    $0x0,%eax
  100bd2:	e8 fb fd ff ff       	callq  1009d2 <console_printf>
    asm volatile ("int %0" : /* no result */
  100bd7:	bf 00 00 00 00       	mov    $0x0,%edi
  100bdc:	cd 30                	int    $0x30
 loop: goto loop;
  100bde:	eb fe                	jmp    100bde <panic+0xa5>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
  100be0:	48 63 c2             	movslq %edx,%rax
  100be3:	81 fa 9f 00 00 00    	cmp    $0x9f,%edx
  100be9:	0f 94 c2             	sete   %dl
  100bec:	0f b6 d2             	movzbl %dl,%edx
  100bef:	48 29 d0             	sub    %rdx,%rax
  100bf2:	48 8d bc 05 08 ff ff 	lea    -0xf8(%rbp,%rax,1),%rdi
  100bf9:	ff 
  100bfa:	be cf 0e 10 00       	mov    $0x100ecf,%esi
  100bff:	e8 f2 f5 ff ff       	callq  1001f6 <strcpy>
  100c04:	eb b1                	jmp    100bb7 <panic+0x7e>

0000000000100c06 <assert_fail>:
    sys_panic(NULL);
 spinloop: goto spinloop;       // should never get here
}

void assert_fail(const char* file, int line, const char* msg) {
  100c06:	55                   	push   %rbp
  100c07:	48 89 e5             	mov    %rsp,%rbp
  100c0a:	48 89 f9             	mov    %rdi,%rcx
  100c0d:	41 89 f0             	mov    %esi,%r8d
  100c10:	49 89 d1             	mov    %rdx,%r9
    (void) console_printf(CPOS(23, 0), 0xC000,
  100c13:	ba d8 0e 10 00       	mov    $0x100ed8,%edx
  100c18:	be 00 c0 00 00       	mov    $0xc000,%esi
  100c1d:	bf 30 07 00 00       	mov    $0x730,%edi
  100c22:	b8 00 00 00 00       	mov    $0x0,%eax
  100c27:	e8 a6 fd ff ff       	callq  1009d2 <console_printf>
    asm volatile ("int %0" : /* no result */
  100c2c:	bf 00 00 00 00       	mov    $0x0,%edi
  100c31:	cd 30                	int    $0x30
 loop: goto loop;
  100c33:	eb fe                	jmp    100c33 <assert_fail+0x2d>
