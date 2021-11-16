
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <entry_from_boot>:
# The entry_from_boot routine sets the stack pointer to the top of the
# OS kernel stack, then jumps to the `kernel` routine.

.globl entry_from_boot
entry_from_boot:
        movq $0x80000, %rsp
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
        movq %rsp, %rbp
   40007:	48 89 e5             	mov    %rsp,%rbp
        pushq $0
   4000a:	6a 00                	pushq  $0x0
        popfq
   4000c:	9d                   	popfq  
        // Check for multiboot command line; if found pass it along.
        cmpl $0x2BADB002, %eax
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
        jne 1f
   40012:	75 0d                	jne    40021 <entry_from_boot+0x21>
        testl $4, (%rbx)
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
        je 1f
   4001a:	74 05                	je     40021 <entry_from_boot+0x21>
        movl 16(%rbx), %edi
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
        jmp 2f
   4001f:	eb 07                	jmp    40028 <entry_from_boot+0x28>
1:      movq $0, %rdi
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
2:      jmp kernel
   40028:	e9 3a 01 00 00       	jmpq   40167 <kernel>
   4002d:	90                   	nop

000000000004002e <gpf_int_handler>:
# Interrupt handlers
.align 2

        .globl gpf_int_handler
gpf_int_handler:
        pushq $13               // trap number
   4002e:	6a 0d                	pushq  $0xd
        jmp generic_exception_handler
   40030:	eb 6e                	jmp    400a0 <generic_exception_handler>

0000000000040032 <pagefault_int_handler>:

        .globl pagefault_int_handler
pagefault_int_handler:
        pushq $14
   40032:	6a 0e                	pushq  $0xe
        jmp generic_exception_handler
   40034:	eb 6a                	jmp    400a0 <generic_exception_handler>

0000000000040036 <timer_int_handler>:

        .globl timer_int_handler
timer_int_handler:
        pushq $0                // error code
   40036:	6a 00                	pushq  $0x0
        pushq $32
   40038:	6a 20                	pushq  $0x20
        jmp generic_exception_handler
   4003a:	eb 64                	jmp    400a0 <generic_exception_handler>

000000000004003c <sys48_int_handler>:

sys48_int_handler:
        pushq $0
   4003c:	6a 00                	pushq  $0x0
        pushq $48
   4003e:	6a 30                	pushq  $0x30
        jmp generic_exception_handler
   40040:	eb 5e                	jmp    400a0 <generic_exception_handler>

0000000000040042 <sys49_int_handler>:

sys49_int_handler:
        pushq $0
   40042:	6a 00                	pushq  $0x0
        pushq $49
   40044:	6a 31                	pushq  $0x31
        jmp generic_exception_handler
   40046:	eb 58                	jmp    400a0 <generic_exception_handler>

0000000000040048 <sys50_int_handler>:

sys50_int_handler:
        pushq $0
   40048:	6a 00                	pushq  $0x0
        pushq $50
   4004a:	6a 32                	pushq  $0x32
        jmp generic_exception_handler
   4004c:	eb 52                	jmp    400a0 <generic_exception_handler>

000000000004004e <sys51_int_handler>:

sys51_int_handler:
        pushq $0
   4004e:	6a 00                	pushq  $0x0
        pushq $51
   40050:	6a 33                	pushq  $0x33
        jmp generic_exception_handler
   40052:	eb 4c                	jmp    400a0 <generic_exception_handler>

0000000000040054 <sys52_int_handler>:

sys52_int_handler:
        pushq $0
   40054:	6a 00                	pushq  $0x0
        pushq $52
   40056:	6a 34                	pushq  $0x34
        jmp generic_exception_handler
   40058:	eb 46                	jmp    400a0 <generic_exception_handler>

000000000004005a <sys53_int_handler>:

sys53_int_handler:
        pushq $0
   4005a:	6a 00                	pushq  $0x0
        pushq $53
   4005c:	6a 35                	pushq  $0x35
        jmp generic_exception_handler
   4005e:	eb 40                	jmp    400a0 <generic_exception_handler>

0000000000040060 <sys54_int_handler>:

sys54_int_handler:
        pushq $0
   40060:	6a 00                	pushq  $0x0
        pushq $54
   40062:	6a 36                	pushq  $0x36
        jmp generic_exception_handler
   40064:	eb 3a                	jmp    400a0 <generic_exception_handler>

0000000000040066 <sys55_int_handler>:

sys55_int_handler:
        pushq $0
   40066:	6a 00                	pushq  $0x0
        pushq $55
   40068:	6a 37                	pushq  $0x37
        jmp generic_exception_handler
   4006a:	eb 34                	jmp    400a0 <generic_exception_handler>

000000000004006c <sys56_int_handler>:

sys56_int_handler:
        pushq $0
   4006c:	6a 00                	pushq  $0x0
        pushq $56
   4006e:	6a 38                	pushq  $0x38
        jmp generic_exception_handler
   40070:	eb 2e                	jmp    400a0 <generic_exception_handler>

0000000000040072 <sys57_int_handler>:

sys57_int_handler:
        pushq $0
   40072:	6a 00                	pushq  $0x0
        pushq $57
   40074:	6a 39                	pushq  $0x39
        jmp generic_exception_handler
   40076:	eb 28                	jmp    400a0 <generic_exception_handler>

0000000000040078 <sys58_int_handler>:

sys58_int_handler:
        pushq $0
   40078:	6a 00                	pushq  $0x0
        pushq $58
   4007a:	6a 3a                	pushq  $0x3a
        jmp generic_exception_handler
   4007c:	eb 22                	jmp    400a0 <generic_exception_handler>

000000000004007e <sys59_int_handler>:

sys59_int_handler:
        pushq $0
   4007e:	6a 00                	pushq  $0x0
        pushq $59
   40080:	6a 3b                	pushq  $0x3b
        jmp generic_exception_handler
   40082:	eb 1c                	jmp    400a0 <generic_exception_handler>

0000000000040084 <sys60_int_handler>:

sys60_int_handler:
        pushq $0
   40084:	6a 00                	pushq  $0x0
        pushq $60
   40086:	6a 3c                	pushq  $0x3c
        jmp generic_exception_handler
   40088:	eb 16                	jmp    400a0 <generic_exception_handler>

000000000004008a <sys61_int_handler>:

sys61_int_handler:
        pushq $0
   4008a:	6a 00                	pushq  $0x0
        pushq $61
   4008c:	6a 3d                	pushq  $0x3d
        jmp generic_exception_handler
   4008e:	eb 10                	jmp    400a0 <generic_exception_handler>

0000000000040090 <sys62_int_handler>:

sys62_int_handler:
        pushq $0
   40090:	6a 00                	pushq  $0x0
        pushq $62
   40092:	6a 3e                	pushq  $0x3e
        jmp generic_exception_handler
   40094:	eb 0a                	jmp    400a0 <generic_exception_handler>

0000000000040096 <sys63_int_handler>:

sys63_int_handler:
        pushq $0
   40096:	6a 00                	pushq  $0x0
        pushq $63
   40098:	6a 3f                	pushq  $0x3f
        jmp generic_exception_handler
   4009a:	eb 04                	jmp    400a0 <generic_exception_handler>

000000000004009c <default_int_handler>:

        .globl default_int_handler
default_int_handler:
        pushq $0
   4009c:	6a 00                	pushq  $0x0
        jmp generic_exception_handler
   4009e:	eb 00                	jmp    400a0 <generic_exception_handler>

00000000000400a0 <generic_exception_handler>:


generic_exception_handler:
        pushq %gs
   400a0:	0f a8                	pushq  %gs
        pushq %fs
   400a2:	0f a0                	pushq  %fs
        pushq %r15
   400a4:	41 57                	push   %r15
        pushq %r14
   400a6:	41 56                	push   %r14
        pushq %r13
   400a8:	41 55                	push   %r13
        pushq %r12
   400aa:	41 54                	push   %r12
        pushq %r11
   400ac:	41 53                	push   %r11
        pushq %r10
   400ae:	41 52                	push   %r10
        pushq %r9
   400b0:	41 51                	push   %r9
        pushq %r8
   400b2:	41 50                	push   %r8
        pushq %rdi
   400b4:	57                   	push   %rdi
        pushq %rsi
   400b5:	56                   	push   %rsi
        pushq %rbp
   400b6:	55                   	push   %rbp
        pushq %rbx
   400b7:	53                   	push   %rbx
        pushq %rdx
   400b8:	52                   	push   %rdx
        pushq %rcx
   400b9:	51                   	push   %rcx
        pushq %rax
   400ba:	50                   	push   %rax
        movq %rsp, %rdi
   400bb:	48 89 e7             	mov    %rsp,%rdi
        call exception
   400be:	e8 3e 09 00 00       	callq  40a01 <exception>

00000000000400c3 <exception_return>:
        # `exception` should never return.


        .globl exception_return
exception_return:
        movq %rdi, %rsp
   400c3:	48 89 fc             	mov    %rdi,%rsp
        popq %rax
   400c6:	58                   	pop    %rax
        popq %rcx
   400c7:	59                   	pop    %rcx
        popq %rdx
   400c8:	5a                   	pop    %rdx
        popq %rbx
   400c9:	5b                   	pop    %rbx
        popq %rbp
   400ca:	5d                   	pop    %rbp
        popq %rsi
   400cb:	5e                   	pop    %rsi
        popq %rdi
   400cc:	5f                   	pop    %rdi
        popq %r8
   400cd:	41 58                	pop    %r8
        popq %r9
   400cf:	41 59                	pop    %r9
        popq %r10
   400d1:	41 5a                	pop    %r10
        popq %r11
   400d3:	41 5b                	pop    %r11
        popq %r12
   400d5:	41 5c                	pop    %r12
        popq %r13
   400d7:	41 5d                	pop    %r13
        popq %r14
   400d9:	41 5e                	pop    %r14
        popq %r15
   400db:	41 5f                	pop    %r15
        popq %fs
   400dd:	0f a1                	popq   %fs
        popq %gs
   400df:	0f a9                	popq   %gs
        addq $16, %rsp
   400e1:	48 83 c4 10          	add    $0x10,%rsp
        iretq
   400e5:	48 cf                	iretq  

00000000000400e7 <sys_int_handlers>:
   400e7:	3c 00                	cmp    $0x0,%al
   400e9:	04 00                	add    $0x0,%al
   400eb:	00 00                	add    %al,(%rax)
   400ed:	00 00                	add    %al,(%rax)
   400ef:	42 00 04 00          	add    %al,(%rax,%r8,1)
   400f3:	00 00                	add    %al,(%rax)
   400f5:	00 00                	add    %al,(%rax)
   400f7:	48 00 04 00          	rex.W add %al,(%rax,%rax,1)
   400fb:	00 00                	add    %al,(%rax)
   400fd:	00 00                	add    %al,(%rax)
   400ff:	4e 00 04 00          	rex.WRX add %r8b,(%rax,%r8,1)
   40103:	00 00                	add    %al,(%rax)
   40105:	00 00                	add    %al,(%rax)
   40107:	54                   	push   %rsp
   40108:	00 04 00             	add    %al,(%rax,%rax,1)
   4010b:	00 00                	add    %al,(%rax)
   4010d:	00 00                	add    %al,(%rax)
   4010f:	5a                   	pop    %rdx
   40110:	00 04 00             	add    %al,(%rax,%rax,1)
   40113:	00 00                	add    %al,(%rax)
   40115:	00 00                	add    %al,(%rax)
   40117:	60                   	(bad)  
   40118:	00 04 00             	add    %al,(%rax,%rax,1)
   4011b:	00 00                	add    %al,(%rax)
   4011d:	00 00                	add    %al,(%rax)
   4011f:	66 00 04 00          	data16 add %al,(%rax,%rax,1)
   40123:	00 00                	add    %al,(%rax)
   40125:	00 00                	add    %al,(%rax)
   40127:	6c                   	insb   (%dx),%es:(%rdi)
   40128:	00 04 00             	add    %al,(%rax,%rax,1)
   4012b:	00 00                	add    %al,(%rax)
   4012d:	00 00                	add    %al,(%rax)
   4012f:	72 00                	jb     40131 <sys_int_handlers+0x4a>
   40131:	04 00                	add    $0x0,%al
   40133:	00 00                	add    %al,(%rax)
   40135:	00 00                	add    %al,(%rax)
   40137:	78 00                	js     40139 <sys_int_handlers+0x52>
   40139:	04 00                	add    $0x0,%al
   4013b:	00 00                	add    %al,(%rax)
   4013d:	00 00                	add    %al,(%rax)
   4013f:	7e 00                	jle    40141 <sys_int_handlers+0x5a>
   40141:	04 00                	add    $0x0,%al
   40143:	00 00                	add    %al,(%rax)
   40145:	00 00                	add    %al,(%rax)
   40147:	84 00                	test   %al,(%rax)
   40149:	04 00                	add    $0x0,%al
   4014b:	00 00                	add    %al,(%rax)
   4014d:	00 00                	add    %al,(%rax)
   4014f:	8a 00                	mov    (%rax),%al
   40151:	04 00                	add    $0x0,%al
   40153:	00 00                	add    %al,(%rax)
   40155:	00 00                	add    %al,(%rax)
   40157:	90                   	nop
   40158:	00 04 00             	add    %al,(%rax,%rax,1)
   4015b:	00 00                	add    %al,(%rax)
   4015d:	00 00                	add    %al,(%rax)
   4015f:	96                   	xchg   %eax,%esi
   40160:	00 04 00             	add    %al,(%rax,%rax,1)
   40163:	00 00                	add    %al,(%rax)
	...

0000000000040167 <kernel>:
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, int program_number);

void kernel(const char* command) {
   40167:	55                   	push   %rbp
   40168:	48 89 e5             	mov    %rsp,%rbp
   4016b:	48 83 ec 20          	sub    $0x20,%rsp
   4016f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    hardware_init();
   40173:	e8 39 16 00 00       	callq  417b1 <hardware_init>
    pageinfo_init();
   40178:	e8 e1 0c 00 00       	callq  40e5e <pageinfo_init>
    console_clear();
   4017d:	e8 aa 39 00 00       	callq  43b2c <console_clear>
    timer_init(HZ);
   40182:	bf 64 00 00 00       	mov    $0x64,%edi
   40187:	e8 15 1b 00 00       	callq  41ca1 <timer_init>

    virtual_memory_map(kernel_pagetable, 0, 0, PROC_START_ADDR, PTE_P | PTE_W);
   4018c:	48 8b 05 6d 0e 01 00 	mov    0x10e6d(%rip),%rax        # 51000 <kernel_pagetable>
   40193:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   40199:	b9 00 00 10 00       	mov    $0x100000,%ecx
   4019e:	ba 00 00 00 00       	mov    $0x0,%edx
   401a3:	be 00 00 00 00       	mov    $0x0,%esi
   401a8:	48 89 c7             	mov    %rax,%rdi
   401ab:	e8 3f 28 00 00       	callq  429ef <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   401b0:	ba 00 80 0b 00       	mov    $0xb8000,%edx
   401b5:	be 00 80 0b 00       	mov    $0xb8000,%esi
   401ba:	48 8b 05 3f 0e 01 00 	mov    0x10e3f(%rip),%rax        # 51000 <kernel_pagetable>
   401c1:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   401c7:	b9 00 10 00 00       	mov    $0x1000,%ecx
   401cc:	48 89 c7             	mov    %rax,%rdi
   401cf:	e8 1b 28 00 00       	callq  429ef <virtual_memory_map>
    
    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   401d4:	ba 00 0e 00 00       	mov    $0xe00,%edx
   401d9:	be 00 00 00 00       	mov    $0x0,%esi
   401de:	bf 20 e0 04 00       	mov    $0x4e020,%edi
   401e3:	e8 5b 30 00 00       	callq  43243 <memset>
    for (pid_t i = 0; i < NPROC; i++) {
   401e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   401ef:	eb 44                	jmp    40235 <kernel+0xce>
        processes[i].p_pid = i;
   401f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   401f4:	48 63 d0             	movslq %eax,%rdx
   401f7:	48 89 d0             	mov    %rdx,%rax
   401fa:	48 c1 e0 03          	shl    $0x3,%rax
   401fe:	48 29 d0             	sub    %rdx,%rax
   40201:	48 c1 e0 05          	shl    $0x5,%rax
   40205:	48 8d 90 20 e0 04 00 	lea    0x4e020(%rax),%rdx
   4020c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4020f:	89 02                	mov    %eax,(%rdx)
        processes[i].p_state = P_FREE;
   40211:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40214:	48 63 d0             	movslq %eax,%rdx
   40217:	48 89 d0             	mov    %rdx,%rax
   4021a:	48 c1 e0 03          	shl    $0x3,%rax
   4021e:	48 29 d0             	sub    %rdx,%rax
   40221:	48 c1 e0 05          	shl    $0x5,%rax
   40225:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   4022b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    for (pid_t i = 0; i < NPROC; i++) {
   40231:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40235:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40239:	7e b6                	jle    401f1 <kernel+0x8a>
    }

    if (command && strcmp(command, "fork") == 0) {
   4023b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40240:	74 29                	je     4026b <kernel+0x104>
   40242:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40246:	be 60 3b 04 00       	mov    $0x43b60,%esi
   4024b:	48 89 c7             	mov    %rax,%rdi
   4024e:	e8 61 30 00 00       	callq  432b4 <strcmp>
   40253:	85 c0                	test   %eax,%eax
   40255:	75 14                	jne    4026b <kernel+0x104>
        process_setup(1, 4);
   40257:	be 04 00 00 00       	mov    $0x4,%esi
   4025c:	bf 01 00 00 00       	mov    $0x1,%edi
   40261:	e8 56 04 00 00       	callq  406bc <process_setup>
   40266:	e9 c2 00 00 00       	jmpq   4032d <kernel+0x1c6>
    } else if (command && strcmp(command, "forkexit") == 0) {
   4026b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40270:	74 29                	je     4029b <kernel+0x134>
   40272:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40276:	be 65 3b 04 00       	mov    $0x43b65,%esi
   4027b:	48 89 c7             	mov    %rax,%rdi
   4027e:	e8 31 30 00 00       	callq  432b4 <strcmp>
   40283:	85 c0                	test   %eax,%eax
   40285:	75 14                	jne    4029b <kernel+0x134>
        process_setup(1, 5);
   40287:	be 05 00 00 00       	mov    $0x5,%esi
   4028c:	bf 01 00 00 00       	mov    $0x1,%edi
   40291:	e8 26 04 00 00       	callq  406bc <process_setup>
   40296:	e9 92 00 00 00       	jmpq   4032d <kernel+0x1c6>
    } else if (command && strcmp(command, "test") == 0) {
   4029b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402a0:	74 26                	je     402c8 <kernel+0x161>
   402a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402a6:	be 6e 3b 04 00       	mov    $0x43b6e,%esi
   402ab:	48 89 c7             	mov    %rax,%rdi
   402ae:	e8 01 30 00 00       	callq  432b4 <strcmp>
   402b3:	85 c0                	test   %eax,%eax
   402b5:	75 11                	jne    402c8 <kernel+0x161>
        process_setup(1, 6);
   402b7:	be 06 00 00 00       	mov    $0x6,%esi
   402bc:	bf 01 00 00 00       	mov    $0x1,%edi
   402c1:	e8 f6 03 00 00       	callq  406bc <process_setup>
   402c6:	eb 65                	jmp    4032d <kernel+0x1c6>
    } else if (command && strcmp(command, "test2") == 0) {
   402c8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402cd:	74 39                	je     40308 <kernel+0x1a1>
   402cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402d3:	be 73 3b 04 00       	mov    $0x43b73,%esi
   402d8:	48 89 c7             	mov    %rax,%rdi
   402db:	e8 d4 2f 00 00       	callq  432b4 <strcmp>
   402e0:	85 c0                	test   %eax,%eax
   402e2:	75 24                	jne    40308 <kernel+0x1a1>
        for (pid_t i = 1; i <= 2; ++i) {
   402e4:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   402eb:	eb 13                	jmp    40300 <kernel+0x199>
            process_setup(i, 6);
   402ed:	8b 45 f8             	mov    -0x8(%rbp),%eax
   402f0:	be 06 00 00 00       	mov    $0x6,%esi
   402f5:	89 c7                	mov    %eax,%edi
   402f7:	e8 c0 03 00 00       	callq  406bc <process_setup>
        for (pid_t i = 1; i <= 2; ++i) {
   402fc:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   40300:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   40304:	7e e7                	jle    402ed <kernel+0x186>
   40306:	eb 25                	jmp    4032d <kernel+0x1c6>
        }
    } else {
        for (pid_t i = 1; i <= 4; ++i) {
   40308:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
   4030f:	eb 16                	jmp    40327 <kernel+0x1c0>
            process_setup(i, i - 1);
   40311:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40314:	8d 50 ff             	lea    -0x1(%rax),%edx
   40317:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4031a:	89 d6                	mov    %edx,%esi
   4031c:	89 c7                	mov    %eax,%edi
   4031e:	e8 99 03 00 00       	callq  406bc <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   40323:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40327:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   4032b:	7e e4                	jle    40311 <kernel+0x1aa>
        }
    }


    // Switch to the first process using run()
    run(&processes[1]);
   4032d:	bf 00 e1 04 00       	mov    $0x4e100,%edi
   40332:	e8 ca 0a 00 00       	callq  40e01 <run>

0000000000040337 <get_free_page_number>:
}

int get_free_page_number(int pages_needed) {
   40337:	55                   	push   %rbp
   40338:	48 89 e5             	mov    %rsp,%rbp
   4033b:	48 83 ec 18          	sub    $0x18,%rsp
   4033f:	89 7d ec             	mov    %edi,-0x14(%rbp)
    int total_pages = PAGENUMBER(MEMSIZE_PHYSICAL);
   40342:	c7 45 f8 00 02 00 00 	movl   $0x200,-0x8(%rbp)
    for (int i = 0; i < total_pages; i++) {
   40349:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40350:	eb 2e                	jmp    40380 <get_free_page_number+0x49>
        if (pageinfo[i].owner == PO_FREE) {
   40352:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40355:	48 98                	cltq   
   40357:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   4035e:	00 
   4035f:	84 c0                	test   %al,%al
   40361:	75 19                	jne    4037c <get_free_page_number+0x45>
            return i + pages_needed - 1 < total_pages ? i : -1;
   40363:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40366:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40369:	01 d0                	add    %edx,%eax
   4036b:	39 45 f8             	cmp    %eax,-0x8(%rbp)
   4036e:	7c 05                	jl     40375 <get_free_page_number+0x3e>
   40370:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40373:	eb 18                	jmp    4038d <get_free_page_number+0x56>
   40375:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4037a:	eb 11                	jmp    4038d <get_free_page_number+0x56>
    for (int i = 0; i < total_pages; i++) {
   4037c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40380:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40383:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   40386:	7c ca                	jl     40352 <get_free_page_number+0x1b>
        }
    }
    return -1;
   40388:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   4038d:	c9                   	leaveq 
   4038e:	c3                   	retq   

000000000004038f <alloc_pt>:

x86_64_pagetable *alloc_pt(pid_t pid) {
   4038f:	55                   	push   %rbp
   40390:	48 89 e5             	mov    %rsp,%rbp
   40393:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
   4039a:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
    size_t sz_pt = sizeof(struct x86_64_pagetable);
   403a0:	48 c7 45 f0 00 10 00 	movq   $0x1000,-0x10(%rbp)
   403a7:	00 
    int i = 5;
   403a8:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)

// L1
    int page_number = get_free_page_number(i--);
   403af:	8b 45 ec             	mov    -0x14(%rbp),%eax
   403b2:	8d 50 ff             	lea    -0x1(%rax),%edx
   403b5:	89 55 ec             	mov    %edx,-0x14(%rbp)
   403b8:	89 c7                	mov    %eax,%edi
   403ba:	e8 78 ff ff ff       	callq  40337 <get_free_page_number>
   403bf:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) return NULL;
   403c2:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   403c6:	75 0a                	jne    403d2 <alloc_pt+0x43>
   403c8:	b8 00 00 00 00       	mov    $0x0,%eax
   403cd:	e9 e8 02 00 00       	jmpq   406ba <alloc_pt+0x32b>

    uintptr_t l1_addr = PAGEADDRESS(page_number);
   403d2:	8b 45 e8             	mov    -0x18(%rbp),%eax
   403d5:	48 98                	cltq   
   403d7:	48 c1 e0 0c          	shl    $0xc,%rax
   403db:	48 89 45 e0          	mov    %rax,-0x20(%rbp)

    int page_result = assign_physical_page(l1_addr, pid);
   403df:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   403e5:	0f be d0             	movsbl %al,%edx
   403e8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   403ec:	89 d6                	mov    %edx,%esi
   403ee:	48 89 c7             	mov    %rax,%rdi
   403f1:	e8 65 04 00 00       	callq  4085b <assign_physical_page>
   403f6:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   403f9:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   403fd:	75 0a                	jne    40409 <alloc_pt+0x7a>
   403ff:	b8 00 00 00 00       	mov    $0x0,%eax
   40404:	e9 b1 02 00 00       	jmpq   406ba <alloc_pt+0x32b>

    memset((void *) l1_addr, 0, sz_pt);
   40409:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4040d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40411:	be 00 00 00 00       	mov    $0x0,%esi
   40416:	48 89 c7             	mov    %rax,%rdi
   40419:	e8 25 2e 00 00       	callq  43243 <memset>

    x86_64_pagetable *l1 = (x86_64_pagetable *) l1_addr;
   4041e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40422:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    
// L2
    page_number = get_free_page_number(i--);
   40426:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40429:	8d 50 ff             	lea    -0x1(%rax),%edx
   4042c:	89 55 ec             	mov    %edx,-0x14(%rbp)
   4042f:	89 c7                	mov    %eax,%edi
   40431:	e8 01 ff ff ff       	callq  40337 <get_free_page_number>
   40436:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   40439:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   4043d:	75 0a                	jne    40449 <alloc_pt+0xba>
        // free(l1);
        return NULL;
   4043f:	b8 00 00 00 00       	mov    $0x0,%eax
   40444:	e9 71 02 00 00       	jmpq   406ba <alloc_pt+0x32b>
    }

    uintptr_t l2_addr = PAGEADDRESS(page_number);
   40449:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4044c:	48 98                	cltq   
   4044e:	48 c1 e0 0c          	shl    $0xc,%rax
   40452:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

    page_result = assign_physical_page(l1_addr, pid);
   40456:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4045c:	0f be d0             	movsbl %al,%edx
   4045f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40463:	89 d6                	mov    %edx,%esi
   40465:	48 89 c7             	mov    %rax,%rdi
   40468:	e8 ee 03 00 00       	callq  4085b <assign_physical_page>
   4046d:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   40470:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   40474:	75 0a                	jne    40480 <alloc_pt+0xf1>
   40476:	b8 00 00 00 00       	mov    $0x0,%eax
   4047b:	e9 3a 02 00 00       	jmpq   406ba <alloc_pt+0x32b>

    memset((void *) l2_addr, 0, sz_pt);
   40480:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40484:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40488:	be 00 00 00 00       	mov    $0x0,%esi
   4048d:	48 89 c7             	mov    %rax,%rdi
   40490:	e8 ae 2d 00 00       	callq  43243 <memset>

    x86_64_pagetable *l2 = (x86_64_pagetable *) l2_addr;
   40495:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40499:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

// L3
    page_number = get_free_page_number(i--);
   4049d:	8b 45 ec             	mov    -0x14(%rbp),%eax
   404a0:	8d 50 ff             	lea    -0x1(%rax),%edx
   404a3:	89 55 ec             	mov    %edx,-0x14(%rbp)
   404a6:	89 c7                	mov    %eax,%edi
   404a8:	e8 8a fe ff ff       	callq  40337 <get_free_page_number>
   404ad:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   404b0:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   404b4:	75 0a                	jne    404c0 <alloc_pt+0x131>
        // free(l1); free(l2);
        return NULL;
   404b6:	b8 00 00 00 00       	mov    $0x0,%eax
   404bb:	e9 fa 01 00 00       	jmpq   406ba <alloc_pt+0x32b>
    }

    uintptr_t l3_addr = PAGEADDRESS(page_number);
   404c0:	8b 45 e8             	mov    -0x18(%rbp),%eax
   404c3:	48 98                	cltq   
   404c5:	48 c1 e0 0c          	shl    $0xc,%rax
   404c9:	48 89 45 b8          	mov    %rax,-0x48(%rbp)

    page_result = assign_physical_page(l1_addr, pid);
   404cd:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   404d3:	0f be d0             	movsbl %al,%edx
   404d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   404da:	89 d6                	mov    %edx,%esi
   404dc:	48 89 c7             	mov    %rax,%rdi
   404df:	e8 77 03 00 00       	callq  4085b <assign_physical_page>
   404e4:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   404e7:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   404eb:	75 0a                	jne    404f7 <alloc_pt+0x168>
   404ed:	b8 00 00 00 00       	mov    $0x0,%eax
   404f2:	e9 c3 01 00 00       	jmpq   406ba <alloc_pt+0x32b>

    memset((void *) l3_addr, 0, sz_pt);
   404f7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   404fb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   404ff:	be 00 00 00 00       	mov    $0x0,%esi
   40504:	48 89 c7             	mov    %rax,%rdi
   40507:	e8 37 2d 00 00       	callq  43243 <memset>

    x86_64_pagetable *l3 = (x86_64_pagetable *) l3_addr;
   4050c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40510:	48 89 45 b0          	mov    %rax,-0x50(%rbp)

// L4i
    page_number = get_free_page_number(i--);
   40514:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40517:	8d 50 ff             	lea    -0x1(%rax),%edx
   4051a:	89 55 ec             	mov    %edx,-0x14(%rbp)
   4051d:	89 c7                	mov    %eax,%edi
   4051f:	e8 13 fe ff ff       	callq  40337 <get_free_page_number>
   40524:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   40527:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   4052b:	75 0a                	jne    40537 <alloc_pt+0x1a8>
        // free(l1); free(l2); free(l3);
        return NULL;
   4052d:	b8 00 00 00 00       	mov    $0x0,%eax
   40532:	e9 83 01 00 00       	jmpq   406ba <alloc_pt+0x32b>
    }

    uintptr_t l4i_addr = PAGEADDRESS(page_number);
   40537:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4053a:	48 98                	cltq   
   4053c:	48 c1 e0 0c          	shl    $0xc,%rax
   40540:	48 89 45 a8          	mov    %rax,-0x58(%rbp)

    page_result = assign_physical_page(l1_addr, pid);
   40544:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4054a:	0f be d0             	movsbl %al,%edx
   4054d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40551:	89 d6                	mov    %edx,%esi
   40553:	48 89 c7             	mov    %rax,%rdi
   40556:	e8 00 03 00 00       	callq  4085b <assign_physical_page>
   4055b:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   4055e:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   40562:	75 0a                	jne    4056e <alloc_pt+0x1df>
   40564:	b8 00 00 00 00       	mov    $0x0,%eax
   40569:	e9 4c 01 00 00       	jmpq   406ba <alloc_pt+0x32b>

    memset((void *) l4i_addr, 0, sz_pt);
   4056e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40572:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40576:	be 00 00 00 00       	mov    $0x0,%esi
   4057b:	48 89 c7             	mov    %rax,%rdi
   4057e:	e8 c0 2c 00 00       	callq  43243 <memset>

    x86_64_pagetable *l4i = (x86_64_pagetable *) l4i_addr;
   40583:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40587:	48 89 45 a0          	mov    %rax,-0x60(%rbp)

// L4j
    page_number = get_free_page_number(i--);
   4058b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4058e:	8d 50 ff             	lea    -0x1(%rax),%edx
   40591:	89 55 ec             	mov    %edx,-0x14(%rbp)
   40594:	89 c7                	mov    %eax,%edi
   40596:	e8 9c fd ff ff       	callq  40337 <get_free_page_number>
   4059b:	89 45 e8             	mov    %eax,-0x18(%rbp)
    if (page_number == -1) {
   4059e:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
   405a2:	75 0a                	jne    405ae <alloc_pt+0x21f>
        // free(l1); free(l2); free(l3); free(l4i);
        return NULL;
   405a4:	b8 00 00 00 00       	mov    $0x0,%eax
   405a9:	e9 0c 01 00 00       	jmpq   406ba <alloc_pt+0x32b>
    }

    uintptr_t l4j_addr = PAGEADDRESS(page_number);
   405ae:	8b 45 e8             	mov    -0x18(%rbp),%eax
   405b1:	48 98                	cltq   
   405b3:	48 c1 e0 0c          	shl    $0xc,%rax
   405b7:	48 89 45 98          	mov    %rax,-0x68(%rbp)

    page_result = assign_physical_page(l1_addr, pid);
   405bb:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   405c1:	0f be d0             	movsbl %al,%edx
   405c4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   405c8:	89 d6                	mov    %edx,%esi
   405ca:	48 89 c7             	mov    %rax,%rdi
   405cd:	e8 89 02 00 00       	callq  4085b <assign_physical_page>
   405d2:	89 45 dc             	mov    %eax,-0x24(%rbp)
    if (page_result == -1) return NULL;
   405d5:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   405d9:	75 0a                	jne    405e5 <alloc_pt+0x256>
   405db:	b8 00 00 00 00       	mov    $0x0,%eax
   405e0:	e9 d5 00 00 00       	jmpq   406ba <alloc_pt+0x32b>

    memset((void *) l4j_addr, 0, sz_pt);
   405e5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   405e9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   405ed:	be 00 00 00 00       	mov    $0x0,%esi
   405f2:	48 89 c7             	mov    %rax,%rdi
   405f5:	e8 49 2c 00 00       	callq  43243 <memset>

    x86_64_pagetable *l4j = (x86_64_pagetable *) l4j_addr;
   405fa:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   405fe:	48 89 45 90          	mov    %rax,-0x70(%rbp)

    // Linking

    int user_perms = PTE_U | PTE_P | PTE_W;
   40602:	c7 45 8c 07 00 00 00 	movl   $0x7,-0x74(%rbp)

    l1->entry[0] = ((x86_64_pageentry_t) l2) | user_perms;
   40609:	8b 45 8c             	mov    -0x74(%rbp),%eax
   4060c:	48 63 d0             	movslq %eax,%rdx
   4060f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40613:	48 09 c2             	or     %rax,%rdx
   40616:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4061a:	48 89 10             	mov    %rdx,(%rax)
    l2->entry[0] = ((x86_64_pageentry_t) l3) | user_perms;
   4061d:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40620:	48 63 d0             	movslq %eax,%rdx
   40623:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40627:	48 09 c2             	or     %rax,%rdx
   4062a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4062e:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[0] = ((x86_64_pageentry_t) l4i) | user_perms;
   40631:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40634:	48 63 d0             	movslq %eax,%rdx
   40637:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   4063b:	48 09 c2             	or     %rax,%rdx
   4063e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40642:	48 89 10             	mov    %rdx,(%rax)
    l3->entry[1] = ((x86_64_pageentry_t) l4j) | user_perms;
   40645:	8b 45 8c             	mov    -0x74(%rbp),%eax
   40648:	48 63 d0             	movslq %eax,%rdx
   4064b:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   4064f:	48 09 c2             	or     %rax,%rdx
   40652:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40656:	48 89 50 08          	mov    %rdx,0x8(%rax)

    // Kernel copy over

    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   4065a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40661:	eb 4a                	jmp    406ad <alloc_pt+0x31e>
        vamapping map = virtual_memory_lookup(kernel_pagetable, va);
   40663:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40666:	48 63 d0             	movslq %eax,%rdx
   40669:	48 8b 0d 90 09 01 00 	mov    0x10990(%rip),%rcx        # 51000 <kernel_pagetable>
   40670:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
   40677:	48 89 ce             	mov    %rcx,%rsi
   4067a:	48 89 c7             	mov    %rax,%rdi
   4067d:	e8 28 27 00 00       	callq  42daa <virtual_memory_lookup>
        virtual_memory_map(l1, va, map.pa, PAGESIZE, map.perm);
   40682:	8b 4d 80             	mov    -0x80(%rbp),%ecx
   40685:	48 8b 95 78 ff ff ff 	mov    -0x88(%rbp),%rdx
   4068c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4068f:	48 63 f0             	movslq %eax,%rsi
   40692:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40696:	41 89 c8             	mov    %ecx,%r8d
   40699:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4069e:	48 89 c7             	mov    %rax,%rdi
   406a1:	e8 49 23 00 00       	callq  429ef <virtual_memory_map>
    for (int va = 0; va < PROC_START_ADDR; va += PAGESIZE) {
   406a6:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
   406ad:	81 7d fc ff ff 0f 00 	cmpl   $0xfffff,-0x4(%rbp)
   406b4:	7e ad                	jle    40663 <alloc_pt+0x2d4>
    }

    return l1;
   406b6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
}
   406ba:	c9                   	leaveq 
   406bb:	c3                   	retq   

00000000000406bc <process_setup>:
// process_setup(pid, program_number)
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number) {
   406bc:	55                   	push   %rbp
   406bd:	48 89 e5             	mov    %rsp,%rbp
   406c0:	48 83 ec 30          	sub    $0x30,%rsp
   406c4:	89 7d dc             	mov    %edi,-0x24(%rbp)
   406c7:	89 75 d8             	mov    %esi,-0x28(%rbp)
    x86_64_pagetable *pt = alloc_pt(pid);
   406ca:	8b 45 dc             	mov    -0x24(%rbp),%eax
   406cd:	89 c7                	mov    %eax,%edi
   406cf:	e8 bb fc ff ff       	callq  4038f <alloc_pt>
   406d4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (pt == NULL) return;
   406d8:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   406dd:	0f 84 75 01 00 00    	je     40858 <process_setup+0x19c>

    process_init(&processes[pid], 0);
   406e3:	8b 45 dc             	mov    -0x24(%rbp),%eax
   406e6:	48 63 d0             	movslq %eax,%rdx
   406e9:	48 89 d0             	mov    %rdx,%rax
   406ec:	48 c1 e0 03          	shl    $0x3,%rax
   406f0:	48 29 d0             	sub    %rdx,%rax
   406f3:	48 c1 e0 05          	shl    $0x5,%rax
   406f7:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   406fd:	be 00 00 00 00       	mov    $0x0,%esi
   40702:	48 89 c7             	mov    %rax,%rdi
   40705:	e8 29 18 00 00       	callq  41f33 <process_init>
    processes[pid].p_pagetable = pt;
   4070a:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4070d:	48 63 d0             	movslq %eax,%rdx
   40710:	48 89 d0             	mov    %rdx,%rax
   40713:	48 c1 e0 03          	shl    $0x3,%rax
   40717:	48 29 d0             	sub    %rdx,%rax
   4071a:	48 c1 e0 05          	shl    $0x5,%rax
   4071e:	48 8d 90 f0 e0 04 00 	lea    0x4e0f0(%rax),%rdx
   40725:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40729:	48 89 02             	mov    %rax,(%rdx)
    ++pageinfo[PAGENUMBER(pt)].refcount;
   4072c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40730:	48 c1 e8 0c          	shr    $0xc,%rax
   40734:	89 c2                	mov    %eax,%edx
   40736:	48 63 c2             	movslq %edx,%rax
   40739:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   40740:	00 
   40741:	83 c0 01             	add    $0x1,%eax
   40744:	89 c1                	mov    %eax,%ecx
   40746:	48 63 c2             	movslq %edx,%rax
   40749:	88 8c 00 41 ee 04 00 	mov    %cl,0x4ee41(%rax,%rax,1)
    int r = program_load(&processes[pid], program_number, NULL);
   40750:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40753:	48 63 d0             	movslq %eax,%rdx
   40756:	48 89 d0             	mov    %rdx,%rax
   40759:	48 c1 e0 03          	shl    $0x3,%rax
   4075d:	48 29 d0             	sub    %rdx,%rax
   40760:	48 c1 e0 05          	shl    $0x5,%rax
   40764:	48 8d 88 20 e0 04 00 	lea    0x4e020(%rax),%rcx
   4076b:	8b 45 d8             	mov    -0x28(%rbp),%eax
   4076e:	ba 00 00 00 00       	mov    $0x0,%edx
   40773:	89 c6                	mov    %eax,%esi
   40775:	48 89 cf             	mov    %rcx,%rdi
   40778:	e8 24 27 00 00       	callq  42ea1 <program_load>
   4077d:	89 45 f4             	mov    %eax,-0xc(%rbp)
    assert(r >= 0);
   40780:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40784:	79 14                	jns    4079a <process_setup+0xde>
   40786:	ba 79 3b 04 00       	mov    $0x43b79,%edx
   4078b:	be f5 00 00 00       	mov    $0xf5,%esi
   40790:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   40795:	e8 56 1f 00 00       	callq  426f0 <assert_fail>

    processes[pid].p_registers.reg_rsp = PROC_START_ADDR + PROC_SIZE * pid;
   4079a:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4079d:	83 c0 04             	add    $0x4,%eax
   407a0:	c1 e0 12             	shl    $0x12,%eax
   407a3:	48 63 d0             	movslq %eax,%rdx
   407a6:	8b 45 dc             	mov    -0x24(%rbp),%eax
   407a9:	48 63 c8             	movslq %eax,%rcx
   407ac:	48 89 c8             	mov    %rcx,%rax
   407af:	48 c1 e0 03          	shl    $0x3,%rax
   407b3:	48 29 c8             	sub    %rcx,%rax
   407b6:	48 c1 e0 05          	shl    $0x5,%rax
   407ba:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   407c0:	48 89 10             	mov    %rdx,(%rax)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   407c3:	8b 45 dc             	mov    -0x24(%rbp),%eax
   407c6:	48 63 d0             	movslq %eax,%rdx
   407c9:	48 89 d0             	mov    %rdx,%rax
   407cc:	48 c1 e0 03          	shl    $0x3,%rax
   407d0:	48 29 d0             	sub    %rdx,%rax
   407d3:	48 c1 e0 05          	shl    $0x5,%rax
   407d7:	48 05 d8 e0 04 00    	add    $0x4e0d8,%rax
   407dd:	48 8b 00             	mov    (%rax),%rax
   407e0:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   407e6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    assign_physical_page(stack_page, pid);
   407ea:	8b 45 dc             	mov    -0x24(%rbp),%eax
   407ed:	0f be d0             	movsbl %al,%edx
   407f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   407f4:	89 d6                	mov    %edx,%esi
   407f6:	48 89 c7             	mov    %rax,%rdi
   407f9:	e8 5d 00 00 00       	callq  4085b <assign_physical_page>
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_page,
   407fe:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40801:	48 63 d0             	movslq %eax,%rdx
   40804:	48 89 d0             	mov    %rdx,%rax
   40807:	48 c1 e0 03          	shl    $0x3,%rax
   4080b:	48 29 d0             	sub    %rdx,%rax
   4080e:	48 c1 e0 05          	shl    $0x5,%rax
   40812:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   40818:	48 8b 00             	mov    (%rax),%rax
   4081b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   4081f:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   40823:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40829:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4082e:	48 89 c7             	mov    %rax,%rdi
   40831:	e8 b9 21 00 00       	callq  429ef <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   40836:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40839:	48 63 d0             	movslq %eax,%rdx
   4083c:	48 89 d0             	mov    %rdx,%rax
   4083f:	48 c1 e0 03          	shl    $0x3,%rax
   40843:	48 29 d0             	sub    %rdx,%rax
   40846:	48 c1 e0 05          	shl    $0x5,%rax
   4084a:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40850:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   40856:	eb 01                	jmp    40859 <process_setup+0x19d>
    if (pt == NULL) return;
   40858:	90                   	nop
}
   40859:	c9                   	leaveq 
   4085a:	c3                   	retq   

000000000004085b <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   4085b:	55                   	push   %rbp
   4085c:	48 89 e5             	mov    %rsp,%rbp
   4085f:	48 83 ec 10          	sub    $0x10,%rsp
   40863:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40867:	89 f0                	mov    %esi,%eax
   40869:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   4086c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40870:	25 ff 0f 00 00       	and    $0xfff,%eax
   40875:	48 85 c0             	test   %rax,%rax
   40878:	75 20                	jne    4089a <assign_physical_page+0x3f>
        || addr >= MEMSIZE_PHYSICAL
   4087a:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40881:	00 
   40882:	77 16                	ja     4089a <assign_physical_page+0x3f>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   40884:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40888:	48 c1 e8 0c          	shr    $0xc,%rax
   4088c:	48 98                	cltq   
   4088e:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   40895:	00 
   40896:	84 c0                	test   %al,%al
   40898:	74 07                	je     408a1 <assign_physical_page+0x46>
        return -1;
   4089a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4089f:	eb 2c                	jmp    408cd <assign_physical_page+0x72>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   408a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408a5:	48 c1 e8 0c          	shr    $0xc,%rax
   408a9:	48 98                	cltq   
   408ab:	c6 84 00 41 ee 04 00 	movb   $0x1,0x4ee41(%rax,%rax,1)
   408b2:	01 
        pageinfo[PAGENUMBER(addr)].owner = owner;
   408b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   408b7:	48 c1 e8 0c          	shr    $0xc,%rax
   408bb:	48 98                	cltq   
   408bd:	0f b6 55 f4          	movzbl -0xc(%rbp),%edx
   408c1:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        return 0;
   408c8:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   408cd:	c9                   	leaveq 
   408ce:	c3                   	retq   

00000000000408cf <syscall_mapping>:

void syscall_mapping(proc* p){
   408cf:	55                   	push   %rbp
   408d0:	48 89 e5             	mov    %rsp,%rbp
   408d3:	48 83 ec 70          	sub    $0x70,%rsp
   408d7:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   408db:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   408df:	48 8b 40 38          	mov    0x38(%rax),%rax
   408e3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   408e7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   408eb:	48 8b 40 30          	mov    0x30(%rax),%rax
   408ef:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    //convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   408f3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   408f7:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   408fe:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   40902:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40906:	48 89 ce             	mov    %rcx,%rsi
   40909:	48 89 c7             	mov    %rax,%rdi
   4090c:	e8 99 24 00 00       	callq  42daa <virtual_memory_lookup>

    // check for write access
    if((map.perm & (PTE_W|PTE_U)) != (PTE_W|PTE_U))
   40911:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40914:	48 98                	cltq   
   40916:	83 e0 06             	and    $0x6,%eax
   40919:	48 83 f8 06          	cmp    $0x6,%rax
   4091d:	75 73                	jne    40992 <syscall_mapping+0xc3>
	return;
    uintptr_t endaddr = map.pa + sizeof(vamapping) - 1;
   4091f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40923:	48 83 c0 17          	add    $0x17,%rax
   40927:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   4092b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4092f:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40936:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   4093a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   4093e:	48 89 ce             	mov    %rcx,%rsi
   40941:	48 89 c7             	mov    %rax,%rdi
   40944:	e8 61 24 00 00       	callq  42daa <virtual_memory_lookup>
    if((end_map.perm & (PTE_W|PTE_P)) != (PTE_W|PTE_P))
   40949:	8b 45 c8             	mov    -0x38(%rbp),%eax
   4094c:	48 98                	cltq   
   4094e:	83 e0 03             	and    $0x3,%eax
   40951:	48 83 f8 03          	cmp    $0x3,%rax
   40955:	75 3e                	jne    40995 <syscall_mapping+0xc6>
	return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   40957:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4095b:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40962:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40966:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4096a:	48 89 ce             	mov    %rcx,%rsi
   4096d:	48 89 c7             	mov    %rax,%rdi
   40970:	e8 35 24 00 00       	callq  42daa <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40975:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40979:	48 89 c1             	mov    %rax,%rcx
   4097c:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40980:	ba 18 00 00 00       	mov    $0x18,%edx
   40985:	48 89 c6             	mov    %rax,%rsi
   40988:	48 89 cf             	mov    %rcx,%rdi
   4098b:	e8 4a 28 00 00       	callq  431da <memcpy>
   40990:	eb 04                	jmp    40996 <syscall_mapping+0xc7>
	return;
   40992:	90                   	nop
   40993:	eb 01                	jmp    40996 <syscall_mapping+0xc7>
	return;
   40995:	90                   	nop
}
   40996:	c9                   	leaveq 
   40997:	c3                   	retq   

0000000000040998 <syscall_mem_tog>:

void syscall_mem_tog(proc* process){
   40998:	55                   	push   %rbp
   40999:	48 89 e5             	mov    %rsp,%rbp
   4099c:	48 83 ec 18          	sub    $0x18,%rsp
   409a0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   409a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   409a8:	48 8b 40 38          	mov    0x38(%rax),%rax
   409ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if(p == 0) {
   409af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   409b3:	75 14                	jne    409c9 <syscall_mem_tog+0x31>
        disp_global = !disp_global;
   409b5:	0f b6 05 44 46 00 00 	movzbl 0x4644(%rip),%eax        # 45000 <disp_global>
   409bc:	84 c0                	test   %al,%al
   409be:	0f 94 c0             	sete   %al
   409c1:	88 05 39 46 00 00    	mov    %al,0x4639(%rip)        # 45000 <disp_global>
   409c7:	eb 36                	jmp    409ff <syscall_mem_tog+0x67>
    }
    else {
        if(p < 0 || p > NPROC || p != process->p_pid)
   409c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   409cd:	78 2f                	js     409fe <syscall_mem_tog+0x66>
   409cf:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   409d3:	7f 29                	jg     409fe <syscall_mem_tog+0x66>
   409d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   409d9:	8b 00                	mov    (%rax),%eax
   409db:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   409de:	75 1e                	jne    409fe <syscall_mem_tog+0x66>
            return;
        process->display_status = !(process->display_status);
   409e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   409e4:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   409eb:	84 c0                	test   %al,%al
   409ed:	0f 94 c0             	sete   %al
   409f0:	89 c2                	mov    %eax,%edx
   409f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   409f6:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   409fc:	eb 01                	jmp    409ff <syscall_mem_tog+0x67>
            return;
   409fe:	90                   	nop
    }
}
   409ff:	c9                   	leaveq 
   40a00:	c3                   	retq   

0000000000040a01 <exception>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers* reg) {
   40a01:	55                   	push   %rbp
   40a02:	48 89 e5             	mov    %rsp,%rbp
   40a05:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
   40a0c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40a13:	48 8b 05 e6 d5 00 00 	mov    0xd5e6(%rip),%rax        # 4e000 <current>
   40a1a:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
   40a21:	48 83 c0 08          	add    $0x8,%rax
   40a25:	48 89 d6             	mov    %rdx,%rsi
   40a28:	ba 18 00 00 00       	mov    $0x18,%edx
   40a2d:	48 89 c7             	mov    %rax,%rdi
   40a30:	48 89 d1             	mov    %rdx,%rcx
   40a33:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40a36:	48 8b 05 c3 05 01 00 	mov    0x105c3(%rip),%rax        # 51000 <kernel_pagetable>
   40a3d:	48 89 c7             	mov    %rax,%rdi
   40a40:	e8 79 1e 00 00       	callq  428be <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   40a45:	8b 05 b1 85 07 00    	mov    0x785b1(%rip),%eax        # b8ffc <cursorpos>
   40a4b:	89 c7                	mov    %eax,%edi
   40a4d:	e8 a0 15 00 00       	callq  41ff2 <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40a52:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40a59:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40a60:	48 83 f8 0e          	cmp    $0xe,%rax
   40a64:	74 14                	je     40a7a <exception+0x79>
   40a66:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40a6d:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40a74:	48 83 f8 0d          	cmp    $0xd,%rax
   40a78:	75 16                	jne    40a90 <exception+0x8f>
            || (reg->reg_err & PFERR_USER)) // pagefault error in user mode 
   40a7a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40a81:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40a88:	83 e0 04             	and    $0x4,%eax
   40a8b:	48 85 c0             	test   %rax,%rax
   40a8e:	74 1a                	je     40aaa <exception+0xa9>
    {
        check_virtual_memory();
   40a90:	e8 60 07 00 00       	callq  411f5 <check_virtual_memory>
        if(disp_global){
   40a95:	0f b6 05 64 45 00 00 	movzbl 0x4564(%rip),%eax        # 45000 <disp_global>
   40a9c:	84 c0                	test   %al,%al
   40a9e:	74 0a                	je     40aaa <exception+0xa9>
            memshow_physical();
   40aa0:	e8 c8 08 00 00       	callq  4136d <memshow_physical>
            memshow_virtual_animate();
   40aa5:	e8 ee 0b 00 00       	callq  41698 <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   40aaa:	e8 20 1a 00 00       	callq  424cf <check_keyboard>


    // Actually handle the exception.
    switch (reg->reg_intno) {
   40aaf:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40ab6:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40abd:	48 83 e8 0e          	sub    $0xe,%rax
   40ac1:	48 83 f8 2a          	cmp    $0x2a,%rax
   40ac5:	0f 87 8b 02 00 00    	ja     40d56 <exception+0x355>
   40acb:	48 8b 04 c5 18 3c 04 	mov    0x43c18(,%rax,8),%rax
   40ad2:	00 
   40ad3:	ff e0                	jmpq   *%rax

    case INT_SYS_PANIC:
	    // rdi stores pointer for msg string
	    {
		char msg[160];
		uintptr_t addr = current->p_registers.reg_rdi;
   40ad5:	48 8b 05 24 d5 00 00 	mov    0xd524(%rip),%rax        # 4e000 <current>
   40adc:	48 8b 40 38          	mov    0x38(%rax),%rax
   40ae0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
		if((void *)addr == NULL)
   40ae4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40ae9:	75 0f                	jne    40afa <exception+0xf9>
		    panic(NULL);
   40aeb:	bf 00 00 00 00       	mov    $0x0,%edi
   40af0:	b8 00 00 00 00       	mov    $0x0,%eax
   40af5:	e8 16 1b 00 00       	callq  42610 <panic>
		vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   40afa:	48 8b 05 ff d4 00 00 	mov    0xd4ff(%rip),%rax        # 4e000 <current>
   40b01:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40b08:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   40b0c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40b10:	48 89 ce             	mov    %rcx,%rsi
   40b13:	48 89 c7             	mov    %rax,%rdi
   40b16:	e8 8f 22 00 00       	callq  42daa <virtual_memory_lookup>
		memcpy(msg, (void *)map.pa, 160);
   40b1b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40b1f:	48 89 c1             	mov    %rax,%rcx
   40b22:	48 8d 85 10 ff ff ff 	lea    -0xf0(%rbp),%rax
   40b29:	ba a0 00 00 00       	mov    $0xa0,%edx
   40b2e:	48 89 ce             	mov    %rcx,%rsi
   40b31:	48 89 c7             	mov    %rax,%rdi
   40b34:	e8 a1 26 00 00       	callq  431da <memcpy>
		panic(msg);
   40b39:	48 8d 85 10 ff ff ff 	lea    -0xf0(%rbp),%rax
   40b40:	48 89 c7             	mov    %rax,%rdi
   40b43:	b8 00 00 00 00       	mov    $0x0,%eax
   40b48:	e8 c3 1a 00 00       	callq  42610 <panic>
	    }
	    panic(NULL);
	    break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   40b4d:	48 8b 05 ac d4 00 00 	mov    0xd4ac(%rip),%rax        # 4e000 <current>
   40b54:	8b 10                	mov    (%rax),%edx
   40b56:	48 8b 05 a3 d4 00 00 	mov    0xd4a3(%rip),%rax        # 4e000 <current>
   40b5d:	48 63 d2             	movslq %edx,%rdx
   40b60:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40b64:	e9 fd 01 00 00       	jmpq   40d66 <exception+0x365>

    case INT_SYS_YIELD:
        schedule();
   40b69:	e8 21 02 00 00       	callq  40d8f <schedule>
        break;                  /* will not be reached */
   40b6e:	e9 f3 01 00 00       	jmpq   40d66 <exception+0x365>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   40b73:	48 8b 05 86 d4 00 00 	mov    0xd486(%rip),%rax        # 4e000 <current>
   40b7a:	48 8b 40 38          	mov    0x38(%rax),%rax
   40b7e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        if (addr < PROC_START_ADDR || addr > MEMSIZE_VIRTUAL || addr % PAGESIZE != 0) {
   40b82:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   40b89:	00 
   40b8a:	76 18                	jbe    40ba4 <exception+0x1a3>
   40b8c:	48 81 7d f8 00 00 30 	cmpq   $0x300000,-0x8(%rbp)
   40b93:	00 
   40b94:	77 0e                	ja     40ba4 <exception+0x1a3>
   40b96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b9a:	25 ff 0f 00 00       	and    $0xfff,%eax
   40b9f:	48 85 c0             	test   %rax,%rax
   40ba2:	74 14                	je     40bb8 <exception+0x1b7>
            current->p_registers.reg_rax = -1; break;
   40ba4:	48 8b 05 55 d4 00 00 	mov    0xd455(%rip),%rax        # 4e000 <current>
   40bab:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40bb2:	ff 
   40bb3:	e9 ae 01 00 00       	jmpq   40d66 <exception+0x365>
        }
        int r = assign_physical_page(addr, current->p_pid);
   40bb8:	48 8b 05 41 d4 00 00 	mov    0xd441(%rip),%rax        # 4e000 <current>
   40bbf:	8b 00                	mov    (%rax),%eax
   40bc1:	0f be d0             	movsbl %al,%edx
   40bc4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40bc8:	89 d6                	mov    %edx,%esi
   40bca:	48 89 c7             	mov    %rax,%rdi
   40bcd:	e8 89 fc ff ff       	callq  4085b <assign_physical_page>
   40bd2:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (r >= 0) {
   40bd5:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40bd9:	78 29                	js     40c04 <exception+0x203>
            virtual_memory_map(current->p_pagetable, addr, addr,
   40bdb:	48 8b 05 1e d4 00 00 	mov    0xd41e(%rip),%rax        # 4e000 <current>
   40be2:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40be9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40bed:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   40bf1:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40bf7:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40bfc:	48 89 c7             	mov    %rax,%rdi
   40bff:	e8 eb 1d 00 00       	callq  429ef <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        }
        current->p_registers.reg_rax = r;
   40c04:	48 8b 05 f5 d3 00 00 	mov    0xd3f5(%rip),%rax        # 4e000 <current>
   40c0b:	8b 55 f4             	mov    -0xc(%rbp),%edx
   40c0e:	48 63 d2             	movslq %edx,%rdx
   40c11:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40c15:	e9 4c 01 00 00       	jmpq   40d66 <exception+0x365>
    }

    case INT_SYS_MAPPING:
    {
	    syscall_mapping(current);
   40c1a:	48 8b 05 df d3 00 00 	mov    0xd3df(%rip),%rax        # 4e000 <current>
   40c21:	48 89 c7             	mov    %rax,%rdi
   40c24:	e8 a6 fc ff ff       	callq  408cf <syscall_mapping>
            break;
   40c29:	e9 38 01 00 00       	jmpq   40d66 <exception+0x365>
    }

    case INT_SYS_MEM_TOG:
	{
	    syscall_mem_tog(current);
   40c2e:	48 8b 05 cb d3 00 00 	mov    0xd3cb(%rip),%rax        # 4e000 <current>
   40c35:	48 89 c7             	mov    %rax,%rdi
   40c38:	e8 5b fd ff ff       	callq  40998 <syscall_mem_tog>
	    break;
   40c3d:	e9 24 01 00 00       	jmpq   40d66 <exception+0x365>
	}

    case INT_TIMER:
        ++ticks;
   40c42:	8b 05 d8 e1 00 00    	mov    0xe1d8(%rip),%eax        # 4ee20 <ticks>
   40c48:	83 c0 01             	add    $0x1,%eax
   40c4b:	89 05 cf e1 00 00    	mov    %eax,0xe1cf(%rip)        # 4ee20 <ticks>
        schedule();
   40c51:	e8 39 01 00 00       	callq  40d8f <schedule>
        break;                  /* will not be reached */
   40c56:	e9 0b 01 00 00       	jmpq   40d66 <exception+0x365>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   40c5b:	0f 20 d0             	mov    %cr2,%rax
   40c5e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    return val;
   40c62:	48 8b 45 c8          	mov    -0x38(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   40c66:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   40c6a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40c71:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40c78:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   40c7b:	48 85 c0             	test   %rax,%rax
   40c7e:	74 07                	je     40c87 <exception+0x286>
   40c80:	b8 89 3b 04 00       	mov    $0x43b89,%eax
   40c85:	eb 05                	jmp    40c8c <exception+0x28b>
   40c87:	b8 8f 3b 04 00       	mov    $0x43b8f,%eax
        const char* operation = reg->reg_err & PFERR_WRITE
   40c8c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   40c90:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40c97:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40c9e:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   40ca1:	48 85 c0             	test   %rax,%rax
   40ca4:	74 07                	je     40cad <exception+0x2ac>
   40ca6:	b8 94 3b 04 00       	mov    $0x43b94,%eax
   40cab:	eb 05                	jmp    40cb2 <exception+0x2b1>
   40cad:	b8 a7 3b 04 00       	mov    $0x43ba7,%eax
        const char* problem = reg->reg_err & PFERR_PRESENT
   40cb2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   40cb6:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40cbd:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40cc4:	83 e0 04             	and    $0x4,%eax
   40cc7:	48 85 c0             	test   %rax,%rax
   40cca:	75 2f                	jne    40cfb <exception+0x2fa>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   40ccc:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40cd3:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   40cda:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
   40cde:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40ce2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40ce6:	49 89 f0             	mov    %rsi,%r8
   40ce9:	48 89 c6             	mov    %rax,%rsi
   40cec:	bf b8 3b 04 00       	mov    $0x43bb8,%edi
   40cf1:	b8 00 00 00 00       	mov    $0x0,%eax
   40cf6:	e8 15 19 00 00       	callq  42610 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   40cfb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
   40d02:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   40d09:	48 8b 05 f0 d2 00 00 	mov    0xd2f0(%rip),%rax        # 4e000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   40d10:	8b 00                	mov    (%rax),%eax
   40d12:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   40d16:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   40d1a:	52                   	push   %rdx
   40d1b:	ff 75 d0             	pushq  -0x30(%rbp)
   40d1e:	49 89 f1             	mov    %rsi,%r9
   40d21:	49 89 c8             	mov    %rcx,%r8
   40d24:	89 c1                	mov    %eax,%ecx
   40d26:	ba e8 3b 04 00       	mov    $0x43be8,%edx
   40d2b:	be 00 0c 00 00       	mov    $0xc00,%esi
   40d30:	bf 80 07 00 00       	mov    $0x780,%edi
   40d35:	b8 00 00 00 00       	mov    $0x0,%eax
   40d3a:	e8 39 2d 00 00       	callq  43a78 <console_printf>
   40d3f:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   40d43:	48 8b 05 b6 d2 00 00 	mov    0xd2b6(%rip),%rax        # 4e000 <current>
   40d4a:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   40d51:	00 00 00 
        break;
   40d54:	eb 10                	jmp    40d66 <exception+0x365>
    }

    default:
        default_exception(current);
   40d56:	48 8b 05 a3 d2 00 00 	mov    0xd2a3(%rip),%rax        # 4e000 <current>
   40d5d:	48 89 c7             	mov    %rax,%rdi
   40d60:	e8 bb 19 00 00       	callq  42720 <default_exception>
        break;                  /* will not be reached */
   40d65:	90                   	nop

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   40d66:	48 8b 05 93 d2 00 00 	mov    0xd293(%rip),%rax        # 4e000 <current>
   40d6d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40d73:	83 f8 01             	cmp    $0x1,%eax
   40d76:	75 0f                	jne    40d87 <exception+0x386>
        run(current);
   40d78:	48 8b 05 81 d2 00 00 	mov    0xd281(%rip),%rax        # 4e000 <current>
   40d7f:	48 89 c7             	mov    %rax,%rdi
   40d82:	e8 7a 00 00 00       	callq  40e01 <run>
    } else {
        schedule();
   40d87:	e8 03 00 00 00       	callq  40d8f <schedule>
    }
}
   40d8c:	90                   	nop
   40d8d:	c9                   	leaveq 
   40d8e:	c3                   	retq   

0000000000040d8f <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   40d8f:	55                   	push   %rbp
   40d90:	48 89 e5             	mov    %rsp,%rbp
   40d93:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   40d97:	48 8b 05 62 d2 00 00 	mov    0xd262(%rip),%rax        # 4e000 <current>
   40d9e:	8b 00                	mov    (%rax),%eax
   40da0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   40da3:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40da6:	83 c0 01             	add    $0x1,%eax
   40da9:	99                   	cltd   
   40daa:	c1 ea 1c             	shr    $0x1c,%edx
   40dad:	01 d0                	add    %edx,%eax
   40daf:	83 e0 0f             	and    $0xf,%eax
   40db2:	29 d0                	sub    %edx,%eax
   40db4:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   40db7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40dba:	48 63 d0             	movslq %eax,%rdx
   40dbd:	48 89 d0             	mov    %rdx,%rax
   40dc0:	48 c1 e0 03          	shl    $0x3,%rax
   40dc4:	48 29 d0             	sub    %rdx,%rax
   40dc7:	48 c1 e0 05          	shl    $0x5,%rax
   40dcb:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   40dd1:	8b 00                	mov    (%rax),%eax
   40dd3:	83 f8 01             	cmp    $0x1,%eax
   40dd6:	75 22                	jne    40dfa <schedule+0x6b>
            run(&processes[pid]);
   40dd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40ddb:	48 63 d0             	movslq %eax,%rdx
   40dde:	48 89 d0             	mov    %rdx,%rax
   40de1:	48 c1 e0 03          	shl    $0x3,%rax
   40de5:	48 29 d0             	sub    %rdx,%rax
   40de8:	48 c1 e0 05          	shl    $0x5,%rax
   40dec:	48 05 20 e0 04 00    	add    $0x4e020,%rax
   40df2:	48 89 c7             	mov    %rax,%rdi
   40df5:	e8 07 00 00 00       	callq  40e01 <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   40dfa:	e8 d0 16 00 00       	callq  424cf <check_keyboard>
        pid = (pid + 1) % NPROC;
   40dff:	eb a2                	jmp    40da3 <schedule+0x14>

0000000000040e01 <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   40e01:	55                   	push   %rbp
   40e02:	48 89 e5             	mov    %rsp,%rbp
   40e05:	48 83 ec 10          	sub    $0x10,%rsp
   40e09:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   40e0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e11:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40e17:	83 f8 01             	cmp    $0x1,%eax
   40e1a:	74 14                	je     40e30 <run+0x2f>
   40e1c:	ba 70 3d 04 00       	mov    $0x43d70,%edx
   40e21:	be cd 01 00 00       	mov    $0x1cd,%esi
   40e26:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   40e2b:	e8 c0 18 00 00       	callq  426f0 <assert_fail>
    current = p;
   40e30:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e34:	48 89 05 c5 d1 00 00 	mov    %rax,0xd1c5(%rip)        # 4e000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   40e3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e3f:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40e46:	48 89 c7             	mov    %rax,%rdi
   40e49:	e8 70 1a 00 00       	callq  428be <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   40e4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e52:	48 83 c0 08          	add    $0x8,%rax
   40e56:	48 89 c7             	mov    %rax,%rdi
   40e59:	e8 65 f2 ff ff       	callq  400c3 <exception_return>

0000000000040e5e <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   40e5e:	55                   	push   %rbp
   40e5f:	48 89 e5             	mov    %rsp,%rbp
   40e62:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   40e66:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40e6d:	00 
   40e6e:	e9 81 00 00 00       	jmpq   40ef4 <pageinfo_init+0x96>
        int owner;
        if (physical_memory_isreserved(addr)) {
   40e73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e77:	48 89 c7             	mov    %rax,%rdi
   40e7a:	e8 ef 0e 00 00       	callq  41d6e <physical_memory_isreserved>
   40e7f:	85 c0                	test   %eax,%eax
   40e81:	74 09                	je     40e8c <pageinfo_init+0x2e>
            owner = PO_RESERVED;
   40e83:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   40e8a:	eb 2f                	jmp    40ebb <pageinfo_init+0x5d>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   40e8c:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   40e93:	00 
   40e94:	76 0b                	jbe    40ea1 <pageinfo_init+0x43>
   40e96:	b8 08 70 05 00       	mov    $0x57008,%eax
   40e9b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40e9f:	72 0a                	jb     40eab <pageinfo_init+0x4d>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   40ea1:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   40ea8:	00 
   40ea9:	75 09                	jne    40eb4 <pageinfo_init+0x56>
            owner = PO_KERNEL;
   40eab:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   40eb2:	eb 07                	jmp    40ebb <pageinfo_init+0x5d>
        } else {
            owner = PO_FREE;
   40eb4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40ebb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40ebf:	48 c1 e8 0c          	shr    $0xc,%rax
   40ec3:	89 c1                	mov    %eax,%ecx
   40ec5:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40ec8:	89 c2                	mov    %eax,%edx
   40eca:	48 63 c1             	movslq %ecx,%rax
   40ecd:	88 94 00 40 ee 04 00 	mov    %dl,0x4ee40(%rax,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   40ed4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40ed8:	0f 95 c2             	setne  %dl
   40edb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40edf:	48 c1 e8 0c          	shr    $0xc,%rax
   40ee3:	48 98                	cltq   
   40ee5:	88 94 00 41 ee 04 00 	mov    %dl,0x4ee41(%rax,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   40eec:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40ef3:	00 
   40ef4:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40efb:	00 
   40efc:	0f 86 71 ff ff ff    	jbe    40e73 <pageinfo_init+0x15>
    }
}
   40f02:	90                   	nop
   40f03:	90                   	nop
   40f04:	c9                   	leaveq 
   40f05:	c3                   	retq   

0000000000040f06 <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   40f06:	55                   	push   %rbp
   40f07:	48 89 e5             	mov    %rsp,%rbp
   40f0a:	48 83 ec 50          	sub    $0x50,%rsp
   40f0e:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   40f12:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40f16:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40f1c:	48 89 c2             	mov    %rax,%rdx
   40f1f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40f23:	48 39 c2             	cmp    %rax,%rdx
   40f26:	74 14                	je     40f3c <check_page_table_mappings+0x36>
   40f28:	ba 90 3d 04 00       	mov    $0x43d90,%edx
   40f2d:	be f7 01 00 00       	mov    $0x1f7,%esi
   40f32:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   40f37:	e8 b4 17 00 00       	callq  426f0 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   40f3c:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   40f43:	00 
   40f44:	e9 9a 00 00 00       	jmpq   40fe3 <check_page_table_mappings+0xdd>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   40f49:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   40f4d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40f51:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40f55:	48 89 ce             	mov    %rcx,%rsi
   40f58:	48 89 c7             	mov    %rax,%rdi
   40f5b:	e8 4a 1e 00 00       	callq  42daa <virtual_memory_lookup>
        if (vam.pa != va) {
   40f60:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40f64:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40f68:	74 27                	je     40f91 <check_page_table_mappings+0x8b>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   40f6a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40f6e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f72:	49 89 d0             	mov    %rdx,%r8
   40f75:	48 89 c1             	mov    %rax,%rcx
   40f78:	ba af 3d 04 00       	mov    $0x43daf,%edx
   40f7d:	be 00 c0 00 00       	mov    $0xc000,%esi
   40f82:	bf e0 06 00 00       	mov    $0x6e0,%edi
   40f87:	b8 00 00 00 00       	mov    $0x0,%eax
   40f8c:	e8 e7 2a 00 00       	callq  43a78 <console_printf>
        }
        assert(vam.pa == va);
   40f91:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40f95:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40f99:	74 14                	je     40faf <check_page_table_mappings+0xa9>
   40f9b:	ba b9 3d 04 00       	mov    $0x43db9,%edx
   40fa0:	be 00 02 00 00       	mov    $0x200,%esi
   40fa5:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   40faa:	e8 41 17 00 00       	callq  426f0 <assert_fail>
        if (va >= (uintptr_t) start_data) {
   40faf:	b8 00 50 04 00       	mov    $0x45000,%eax
   40fb4:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40fb8:	72 21                	jb     40fdb <check_page_table_mappings+0xd5>
            assert(vam.perm & PTE_W);
   40fba:	8b 45 d0             	mov    -0x30(%rbp),%eax
   40fbd:	48 98                	cltq   
   40fbf:	83 e0 02             	and    $0x2,%eax
   40fc2:	48 85 c0             	test   %rax,%rax
   40fc5:	75 14                	jne    40fdb <check_page_table_mappings+0xd5>
   40fc7:	ba c6 3d 04 00       	mov    $0x43dc6,%edx
   40fcc:	be 02 02 00 00       	mov    $0x202,%esi
   40fd1:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   40fd6:	e8 15 17 00 00       	callq  426f0 <assert_fail>
         va += PAGESIZE) {
   40fdb:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40fe2:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   40fe3:	b8 08 70 05 00       	mov    $0x57008,%eax
   40fe8:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40fec:	0f 82 57 ff ff ff    	jb     40f49 <check_page_table_mappings+0x43>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   40ff2:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   40ff9:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   40ffa:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   40ffe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   41002:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41006:	48 89 ce             	mov    %rcx,%rsi
   41009:	48 89 c7             	mov    %rax,%rdi
   4100c:	e8 99 1d 00 00       	callq  42daa <virtual_memory_lookup>
    assert(vam.pa == kstack);
   41011:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41015:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   41019:	74 14                	je     4102f <check_page_table_mappings+0x129>
   4101b:	ba d7 3d 04 00       	mov    $0x43dd7,%edx
   41020:	be 09 02 00 00       	mov    $0x209,%esi
   41025:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   4102a:	e8 c1 16 00 00       	callq  426f0 <assert_fail>
    assert(vam.perm & PTE_W);
   4102f:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41032:	48 98                	cltq   
   41034:	83 e0 02             	and    $0x2,%eax
   41037:	48 85 c0             	test   %rax,%rax
   4103a:	75 14                	jne    41050 <check_page_table_mappings+0x14a>
   4103c:	ba c6 3d 04 00       	mov    $0x43dc6,%edx
   41041:	be 0a 02 00 00       	mov    $0x20a,%esi
   41046:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   4104b:	e8 a0 16 00 00       	callq  426f0 <assert_fail>
}
   41050:	90                   	nop
   41051:	c9                   	leaveq 
   41052:	c3                   	retq   

0000000000041053 <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   41053:	55                   	push   %rbp
   41054:	48 89 e5             	mov    %rsp,%rbp
   41057:	48 83 ec 20          	sub    $0x20,%rsp
   4105b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4105f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   41062:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41065:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   41068:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   4106f:	48 8b 05 8a ff 00 00 	mov    0xff8a(%rip),%rax        # 51000 <kernel_pagetable>
   41076:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   4107a:	75 67                	jne    410e3 <check_page_table_ownership+0x90>
        owner = PO_KERNEL;
   4107c:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   41083:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   4108a:	eb 51                	jmp    410dd <check_page_table_ownership+0x8a>
            if (processes[xpid].p_state != P_FREE
   4108c:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4108f:	48 63 d0             	movslq %eax,%rdx
   41092:	48 89 d0             	mov    %rdx,%rax
   41095:	48 c1 e0 03          	shl    $0x3,%rax
   41099:	48 29 d0             	sub    %rdx,%rax
   4109c:	48 c1 e0 05          	shl    $0x5,%rax
   410a0:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   410a6:	8b 00                	mov    (%rax),%eax
   410a8:	85 c0                	test   %eax,%eax
   410aa:	74 2d                	je     410d9 <check_page_table_ownership+0x86>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   410ac:	8b 45 f4             	mov    -0xc(%rbp),%eax
   410af:	48 63 d0             	movslq %eax,%rdx
   410b2:	48 89 d0             	mov    %rdx,%rax
   410b5:	48 c1 e0 03          	shl    $0x3,%rax
   410b9:	48 29 d0             	sub    %rdx,%rax
   410bc:	48 c1 e0 05          	shl    $0x5,%rax
   410c0:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   410c6:	48 8b 10             	mov    (%rax),%rdx
   410c9:	48 8b 05 30 ff 00 00 	mov    0xff30(%rip),%rax        # 51000 <kernel_pagetable>
   410d0:	48 39 c2             	cmp    %rax,%rdx
   410d3:	75 04                	jne    410d9 <check_page_table_ownership+0x86>
                ++expected_refcount;
   410d5:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   410d9:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   410dd:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   410e1:	7e a9                	jle    4108c <check_page_table_ownership+0x39>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   410e3:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   410e6:	8b 55 fc             	mov    -0x4(%rbp),%edx
   410e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   410ed:	be 00 00 00 00       	mov    $0x0,%esi
   410f2:	48 89 c7             	mov    %rax,%rdi
   410f5:	e8 03 00 00 00       	callq  410fd <check_page_table_ownership_level>
}
   410fa:	90                   	nop
   410fb:	c9                   	leaveq 
   410fc:	c3                   	retq   

00000000000410fd <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   410fd:	55                   	push   %rbp
   410fe:	48 89 e5             	mov    %rsp,%rbp
   41101:	48 83 ec 30          	sub    $0x30,%rsp
   41105:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41109:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   4110c:	89 55 e0             	mov    %edx,-0x20(%rbp)
   4110f:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   41112:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41116:	48 c1 e8 0c          	shr    $0xc,%rax
   4111a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   4111f:	7e 14                	jle    41135 <check_page_table_ownership_level+0x38>
   41121:	ba e8 3d 04 00       	mov    $0x43de8,%edx
   41126:	be 27 02 00 00       	mov    $0x227,%esi
   4112b:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   41130:	e8 bb 15 00 00       	callq  426f0 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   41135:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41139:	48 c1 e8 0c          	shr    $0xc,%rax
   4113d:	48 98                	cltq   
   4113f:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41146:	00 
   41147:	0f be c0             	movsbl %al,%eax
   4114a:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   4114d:	74 14                	je     41163 <check_page_table_ownership_level+0x66>
   4114f:	ba 00 3e 04 00       	mov    $0x43e00,%edx
   41154:	be 28 02 00 00       	mov    $0x228,%esi
   41159:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   4115e:	e8 8d 15 00 00       	callq  426f0 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   41163:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41167:	48 c1 e8 0c          	shr    $0xc,%rax
   4116b:	48 98                	cltq   
   4116d:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41174:	00 
   41175:	0f be c0             	movsbl %al,%eax
   41178:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   4117b:	74 14                	je     41191 <check_page_table_ownership_level+0x94>
   4117d:	ba 28 3e 04 00       	mov    $0x43e28,%edx
   41182:	be 29 02 00 00       	mov    $0x229,%esi
   41187:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   4118c:	e8 5f 15 00 00       	callq  426f0 <assert_fail>
    if (level < 3) {
   41191:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   41195:	7f 5b                	jg     411f2 <check_page_table_ownership_level+0xf5>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41197:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4119e:	eb 49                	jmp    411e9 <check_page_table_ownership_level+0xec>
            if (pt->entry[index]) {
   411a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   411a4:	8b 55 fc             	mov    -0x4(%rbp),%edx
   411a7:	48 63 d2             	movslq %edx,%rdx
   411aa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   411ae:	48 85 c0             	test   %rax,%rax
   411b1:	74 32                	je     411e5 <check_page_table_ownership_level+0xe8>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   411b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   411b7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   411ba:	48 63 d2             	movslq %edx,%rdx
   411bd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   411c1:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   411c7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   411cb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   411ce:	8d 70 01             	lea    0x1(%rax),%esi
   411d1:	8b 55 e0             	mov    -0x20(%rbp),%edx
   411d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   411d8:	b9 01 00 00 00       	mov    $0x1,%ecx
   411dd:	48 89 c7             	mov    %rax,%rdi
   411e0:	e8 18 ff ff ff       	callq  410fd <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   411e5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   411e9:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   411f0:	7e ae                	jle    411a0 <check_page_table_ownership_level+0xa3>
            }
        }
    }
}
   411f2:	90                   	nop
   411f3:	c9                   	leaveq 
   411f4:	c3                   	retq   

00000000000411f5 <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   411f5:	55                   	push   %rbp
   411f6:	48 89 e5             	mov    %rsp,%rbp
   411f9:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   411fd:	8b 05 e5 ce 00 00    	mov    0xcee5(%rip),%eax        # 4e0e8 <processes+0xc8>
   41203:	85 c0                	test   %eax,%eax
   41205:	74 14                	je     4121b <check_virtual_memory+0x26>
   41207:	ba 58 3e 04 00       	mov    $0x43e58,%edx
   4120c:	be 3c 02 00 00       	mov    $0x23c,%esi
   41211:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   41216:	e8 d5 14 00 00       	callq  426f0 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   4121b:	48 8b 05 de fd 00 00 	mov    0xfdde(%rip),%rax        # 51000 <kernel_pagetable>
   41222:	48 89 c7             	mov    %rax,%rdi
   41225:	e8 dc fc ff ff       	callq  40f06 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   4122a:	48 8b 05 cf fd 00 00 	mov    0xfdcf(%rip),%rax        # 51000 <kernel_pagetable>
   41231:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41236:	48 89 c7             	mov    %rax,%rdi
   41239:	e8 15 fe ff ff       	callq  41053 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   4123e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41245:	e9 9c 00 00 00       	jmpq   412e6 <check_virtual_memory+0xf1>
        if (processes[pid].p_state != P_FREE
   4124a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4124d:	48 63 d0             	movslq %eax,%rdx
   41250:	48 89 d0             	mov    %rdx,%rax
   41253:	48 c1 e0 03          	shl    $0x3,%rax
   41257:	48 29 d0             	sub    %rdx,%rax
   4125a:	48 c1 e0 05          	shl    $0x5,%rax
   4125e:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41264:	8b 00                	mov    (%rax),%eax
   41266:	85 c0                	test   %eax,%eax
   41268:	74 78                	je     412e2 <check_virtual_memory+0xed>
            && processes[pid].p_pagetable != kernel_pagetable) {
   4126a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4126d:	48 63 d0             	movslq %eax,%rdx
   41270:	48 89 d0             	mov    %rdx,%rax
   41273:	48 c1 e0 03          	shl    $0x3,%rax
   41277:	48 29 d0             	sub    %rdx,%rax
   4127a:	48 c1 e0 05          	shl    $0x5,%rax
   4127e:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   41284:	48 8b 10             	mov    (%rax),%rdx
   41287:	48 8b 05 72 fd 00 00 	mov    0xfd72(%rip),%rax        # 51000 <kernel_pagetable>
   4128e:	48 39 c2             	cmp    %rax,%rdx
   41291:	74 4f                	je     412e2 <check_virtual_memory+0xed>
            check_page_table_mappings(processes[pid].p_pagetable);
   41293:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41296:	48 63 d0             	movslq %eax,%rdx
   41299:	48 89 d0             	mov    %rdx,%rax
   4129c:	48 c1 e0 03          	shl    $0x3,%rax
   412a0:	48 29 d0             	sub    %rdx,%rax
   412a3:	48 c1 e0 05          	shl    $0x5,%rax
   412a7:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   412ad:	48 8b 00             	mov    (%rax),%rax
   412b0:	48 89 c7             	mov    %rax,%rdi
   412b3:	e8 4e fc ff ff       	callq  40f06 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   412b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   412bb:	48 63 d0             	movslq %eax,%rdx
   412be:	48 89 d0             	mov    %rdx,%rax
   412c1:	48 c1 e0 03          	shl    $0x3,%rax
   412c5:	48 29 d0             	sub    %rdx,%rax
   412c8:	48 c1 e0 05          	shl    $0x5,%rax
   412cc:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   412d2:	48 8b 00             	mov    (%rax),%rax
   412d5:	8b 55 fc             	mov    -0x4(%rbp),%edx
   412d8:	89 d6                	mov    %edx,%esi
   412da:	48 89 c7             	mov    %rax,%rdi
   412dd:	e8 71 fd ff ff       	callq  41053 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   412e2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   412e6:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   412ea:	0f 8e 5a ff ff ff    	jle    4124a <check_virtual_memory+0x55>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   412f0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   412f7:	eb 67                	jmp    41360 <check_virtual_memory+0x16b>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   412f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
   412fc:	48 98                	cltq   
   412fe:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41305:	00 
   41306:	84 c0                	test   %al,%al
   41308:	7e 52                	jle    4135c <check_virtual_memory+0x167>
   4130a:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4130d:	48 98                	cltq   
   4130f:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41316:	00 
   41317:	84 c0                	test   %al,%al
   41319:	78 41                	js     4135c <check_virtual_memory+0x167>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   4131b:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4131e:	48 98                	cltq   
   41320:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   41327:	00 
   41328:	0f be c0             	movsbl %al,%eax
   4132b:	48 63 d0             	movslq %eax,%rdx
   4132e:	48 89 d0             	mov    %rdx,%rax
   41331:	48 c1 e0 03          	shl    $0x3,%rax
   41335:	48 29 d0             	sub    %rdx,%rax
   41338:	48 c1 e0 05          	shl    $0x5,%rax
   4133c:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41342:	8b 00                	mov    (%rax),%eax
   41344:	85 c0                	test   %eax,%eax
   41346:	75 14                	jne    4135c <check_virtual_memory+0x167>
   41348:	ba 78 3e 04 00       	mov    $0x43e78,%edx
   4134d:	be 53 02 00 00       	mov    $0x253,%esi
   41352:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   41357:	e8 94 13 00 00       	callq  426f0 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4135c:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41360:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   41367:	7e 90                	jle    412f9 <check_virtual_memory+0x104>
        }
    }
}
   41369:	90                   	nop
   4136a:	90                   	nop
   4136b:	c9                   	leaveq 
   4136c:	c3                   	retq   

000000000004136d <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'
};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void) {
   4136d:	55                   	push   %rbp
   4136e:	48 89 e5             	mov    %rsp,%rbp
   41371:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   41375:	ba e6 3e 04 00       	mov    $0x43ee6,%edx
   4137a:	be 00 0f 00 00       	mov    $0xf00,%esi
   4137f:	bf 20 00 00 00       	mov    $0x20,%edi
   41384:	b8 00 00 00 00       	mov    $0x0,%eax
   41389:	e8 ea 26 00 00       	callq  43a78 <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4138e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41395:	e9 f4 00 00 00       	jmpq   4148e <memshow_physical+0x121>
        if (pn % 64 == 0) {
   4139a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4139d:	83 e0 3f             	and    $0x3f,%eax
   413a0:	85 c0                	test   %eax,%eax
   413a2:	75 3e                	jne    413e2 <memshow_physical+0x75>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   413a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413a7:	c1 e0 0c             	shl    $0xc,%eax
   413aa:	89 c2                	mov    %eax,%edx
   413ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413af:	8d 48 3f             	lea    0x3f(%rax),%ecx
   413b2:	85 c0                	test   %eax,%eax
   413b4:	0f 48 c1             	cmovs  %ecx,%eax
   413b7:	c1 f8 06             	sar    $0x6,%eax
   413ba:	8d 48 01             	lea    0x1(%rax),%ecx
   413bd:	89 c8                	mov    %ecx,%eax
   413bf:	c1 e0 02             	shl    $0x2,%eax
   413c2:	01 c8                	add    %ecx,%eax
   413c4:	c1 e0 04             	shl    $0x4,%eax
   413c7:	83 c0 03             	add    $0x3,%eax
   413ca:	89 d1                	mov    %edx,%ecx
   413cc:	ba f6 3e 04 00       	mov    $0x43ef6,%edx
   413d1:	be 00 0f 00 00       	mov    $0xf00,%esi
   413d6:	89 c7                	mov    %eax,%edi
   413d8:	b8 00 00 00 00       	mov    $0x0,%eax
   413dd:	e8 96 26 00 00       	callq  43a78 <console_printf>
        }

        int owner = pageinfo[pn].owner;
   413e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413e5:	48 98                	cltq   
   413e7:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   413ee:	00 
   413ef:	0f be c0             	movsbl %al,%eax
   413f2:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   413f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413f8:	48 98                	cltq   
   413fa:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   41401:	00 
   41402:	84 c0                	test   %al,%al
   41404:	75 07                	jne    4140d <memshow_physical+0xa0>
            owner = PO_FREE;
   41406:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   4140d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41410:	83 c0 02             	add    $0x2,%eax
   41413:	48 98                	cltq   
   41415:	0f b7 84 00 c0 3e 04 	movzwl 0x43ec0(%rax,%rax,1),%eax
   4141c:	00 
   4141d:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR)){
   41421:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41424:	48 98                	cltq   
   41426:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   4142d:	00 
   4142e:	3c 01                	cmp    $0x1,%al
   41430:	7e 1a                	jle    4144c <memshow_physical+0xdf>
   41432:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   41437:	48 c1 e8 0c          	shr    $0xc,%rax
   4143b:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   4143e:	74 0c                	je     4144c <memshow_physical+0xdf>
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   41440:	b8 53 00 00 00       	mov    $0x53,%eax
   41445:	80 cc 0f             	or     $0xf,%ah
   41448:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
	    color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   4144c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4144f:	8d 50 3f             	lea    0x3f(%rax),%edx
   41452:	85 c0                	test   %eax,%eax
   41454:	0f 48 c2             	cmovs  %edx,%eax
   41457:	c1 f8 06             	sar    $0x6,%eax
   4145a:	8d 50 01             	lea    0x1(%rax),%edx
   4145d:	89 d0                	mov    %edx,%eax
   4145f:	c1 e0 02             	shl    $0x2,%eax
   41462:	01 d0                	add    %edx,%eax
   41464:	c1 e0 04             	shl    $0x4,%eax
   41467:	89 c1                	mov    %eax,%ecx
   41469:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4146c:	99                   	cltd   
   4146d:	c1 ea 1a             	shr    $0x1a,%edx
   41470:	01 d0                	add    %edx,%eax
   41472:	83 e0 3f             	and    $0x3f,%eax
   41475:	29 d0                	sub    %edx,%eax
   41477:	83 c0 0c             	add    $0xc,%eax
   4147a:	01 c8                	add    %ecx,%eax
   4147c:	48 98                	cltq   
   4147e:	0f b7 55 f6          	movzwl -0xa(%rbp),%edx
   41482:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   41489:	00 
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4148a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4148e:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41495:	0f 8e ff fe ff ff    	jle    4139a <memshow_physical+0x2d>
    }
}
   4149b:	90                   	nop
   4149c:	90                   	nop
   4149d:	c9                   	leaveq 
   4149e:	c3                   	retq   

000000000004149f <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   4149f:	55                   	push   %rbp
   414a0:	48 89 e5             	mov    %rsp,%rbp
   414a3:	48 83 ec 40          	sub    $0x40,%rsp
   414a7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   414ab:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   414af:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   414b3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   414b9:	48 89 c2             	mov    %rax,%rdx
   414bc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   414c0:	48 39 c2             	cmp    %rax,%rdx
   414c3:	74 14                	je     414d9 <memshow_virtual+0x3a>
   414c5:	ba 00 3f 04 00       	mov    $0x43f00,%edx
   414ca:	be 84 02 00 00       	mov    $0x284,%esi
   414cf:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   414d4:	e8 17 12 00 00       	callq  426f0 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   414d9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   414dd:	48 89 c1             	mov    %rax,%rcx
   414e0:	ba 2d 3f 04 00       	mov    $0x43f2d,%edx
   414e5:	be 00 0f 00 00       	mov    $0xf00,%esi
   414ea:	bf 3a 03 00 00       	mov    $0x33a,%edi
   414ef:	b8 00 00 00 00       	mov    $0x0,%eax
   414f4:	e8 7f 25 00 00       	callq  43a78 <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   414f9:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41500:	00 
   41501:	e9 80 01 00 00       	jmpq   41686 <memshow_virtual+0x1e7>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41506:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4150a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4150e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41512:	48 89 ce             	mov    %rcx,%rsi
   41515:	48 89 c7             	mov    %rax,%rdi
   41518:	e8 8d 18 00 00       	callq  42daa <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   4151d:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41520:	85 c0                	test   %eax,%eax
   41522:	79 0b                	jns    4152f <memshow_virtual+0x90>
            color = ' ';
   41524:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   4152a:	e9 d7 00 00 00       	jmpq   41606 <memshow_virtual+0x167>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   4152f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41533:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   41539:	76 14                	jbe    4154f <memshow_virtual+0xb0>
   4153b:	ba 4a 3f 04 00       	mov    $0x43f4a,%edx
   41540:	be 8d 02 00 00       	mov    $0x28d,%esi
   41545:	bf 80 3b 04 00       	mov    $0x43b80,%edi
   4154a:	e8 a1 11 00 00       	callq  426f0 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   4154f:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41552:	48 98                	cltq   
   41554:	0f b6 84 00 40 ee 04 	movzbl 0x4ee40(%rax,%rax,1),%eax
   4155b:	00 
   4155c:	0f be c0             	movsbl %al,%eax
   4155f:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   41562:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41565:	48 98                	cltq   
   41567:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   4156e:	00 
   4156f:	84 c0                	test   %al,%al
   41571:	75 07                	jne    4157a <memshow_virtual+0xdb>
                owner = PO_FREE;
   41573:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   4157a:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4157d:	83 c0 02             	add    $0x2,%eax
   41580:	48 98                	cltq   
   41582:	0f b7 84 00 c0 3e 04 	movzwl 0x43ec0(%rax,%rax,1),%eax
   41589:	00 
   4158a:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   4158e:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41591:	48 98                	cltq   
   41593:	83 e0 04             	and    $0x4,%eax
   41596:	48 85 c0             	test   %rax,%rax
   41599:	74 27                	je     415c2 <memshow_virtual+0x123>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   4159b:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4159f:	c1 e0 04             	shl    $0x4,%eax
   415a2:	66 25 00 f0          	and    $0xf000,%ax
   415a6:	89 c2                	mov    %eax,%edx
   415a8:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   415ac:	c1 f8 04             	sar    $0x4,%eax
   415af:	66 25 00 0f          	and    $0xf00,%ax
   415b3:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   415b5:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   415b9:	0f b6 c0             	movzbl %al,%eax
   415bc:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   415be:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR) {
   415c2:	8b 45 d0             	mov    -0x30(%rbp),%eax
   415c5:	48 98                	cltq   
   415c7:	0f b6 84 00 41 ee 04 	movzbl 0x4ee41(%rax,%rax,1),%eax
   415ce:	00 
   415cf:	3c 01                	cmp    $0x1,%al
   415d1:	7e 33                	jle    41606 <memshow_virtual+0x167>
   415d3:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   415d8:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   415dc:	74 28                	je     41606 <memshow_virtual+0x167>
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   415de:	b8 53 00 00 00       	mov    $0x53,%eax
   415e3:	89 c2                	mov    %eax,%edx
   415e5:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   415e9:	66 25 00 f0          	and    $0xf000,%ax
   415ed:	09 d0                	or     %edx,%eax
   415ef:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if(! (vam.perm & PTE_U))
   415f3:	8b 45 e0             	mov    -0x20(%rbp),%eax
   415f6:	48 98                	cltq   
   415f8:	83 e0 04             	and    $0x4,%eax
   415fb:	48 85 c0             	test   %rax,%rax
   415fe:	75 06                	jne    41606 <memshow_virtual+0x167>
                    color = color | 0x0F00;
   41600:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
		color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   41606:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4160a:	48 c1 e8 0c          	shr    $0xc,%rax
   4160e:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   41611:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41614:	83 e0 3f             	and    $0x3f,%eax
   41617:	85 c0                	test   %eax,%eax
   41619:	75 34                	jne    4164f <memshow_virtual+0x1b0>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   4161b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4161e:	c1 e8 06             	shr    $0x6,%eax
   41621:	89 c2                	mov    %eax,%edx
   41623:	89 d0                	mov    %edx,%eax
   41625:	c1 e0 02             	shl    $0x2,%eax
   41628:	01 d0                	add    %edx,%eax
   4162a:	c1 e0 04             	shl    $0x4,%eax
   4162d:	05 73 03 00 00       	add    $0x373,%eax
   41632:	89 c7                	mov    %eax,%edi
   41634:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41638:	48 89 c1             	mov    %rax,%rcx
   4163b:	ba f6 3e 04 00       	mov    $0x43ef6,%edx
   41640:	be 00 0f 00 00       	mov    $0xf00,%esi
   41645:	b8 00 00 00 00       	mov    $0x0,%eax
   4164a:	e8 29 24 00 00       	callq  43a78 <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   4164f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41652:	c1 e8 06             	shr    $0x6,%eax
   41655:	89 c2                	mov    %eax,%edx
   41657:	89 d0                	mov    %edx,%eax
   41659:	c1 e0 02             	shl    $0x2,%eax
   4165c:	01 d0                	add    %edx,%eax
   4165e:	c1 e0 04             	shl    $0x4,%eax
   41661:	89 c2                	mov    %eax,%edx
   41663:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41666:	83 e0 3f             	and    $0x3f,%eax
   41669:	01 d0                	add    %edx,%eax
   4166b:	05 7c 03 00 00       	add    $0x37c,%eax
   41670:	89 c2                	mov    %eax,%edx
   41672:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41676:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   4167d:	00 
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   4167e:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41685:	00 
   41686:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   4168d:	00 
   4168e:	0f 86 72 fe ff ff    	jbe    41506 <memshow_virtual+0x67>
    }
}
   41694:	90                   	nop
   41695:	90                   	nop
   41696:	c9                   	leaveq 
   41697:	c3                   	retq   

0000000000041698 <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   41698:	55                   	push   %rbp
   41699:	48 89 e5             	mov    %rsp,%rbp
   4169c:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   416a0:	8b 05 9a db 00 00    	mov    0xdb9a(%rip),%eax        # 4f240 <last_ticks.1>
   416a6:	85 c0                	test   %eax,%eax
   416a8:	74 13                	je     416bd <memshow_virtual_animate+0x25>
   416aa:	8b 05 70 d7 00 00    	mov    0xd770(%rip),%eax        # 4ee20 <ticks>
   416b0:	8b 15 8a db 00 00    	mov    0xdb8a(%rip),%edx        # 4f240 <last_ticks.1>
   416b6:	29 d0                	sub    %edx,%eax
   416b8:	83 f8 31             	cmp    $0x31,%eax
   416bb:	76 2c                	jbe    416e9 <memshow_virtual_animate+0x51>
        last_ticks = ticks;
   416bd:	8b 05 5d d7 00 00    	mov    0xd75d(%rip),%eax        # 4ee20 <ticks>
   416c3:	89 05 77 db 00 00    	mov    %eax,0xdb77(%rip)        # 4f240 <last_ticks.1>
        ++showing;
   416c9:	8b 05 35 39 00 00    	mov    0x3935(%rip),%eax        # 45004 <showing.0>
   416cf:	83 c0 01             	add    $0x1,%eax
   416d2:	89 05 2c 39 00 00    	mov    %eax,0x392c(%rip)        # 45004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   416d8:	eb 0f                	jmp    416e9 <memshow_virtual_animate+0x51>
           && processes[showing % NPROC].p_state == P_FREE) {
        ++showing;
   416da:	8b 05 24 39 00 00    	mov    0x3924(%rip),%eax        # 45004 <showing.0>
   416e0:	83 c0 01             	add    $0x1,%eax
   416e3:	89 05 1b 39 00 00    	mov    %eax,0x391b(%rip)        # 45004 <showing.0>
    while (showing <= 2*NPROC
   416e9:	8b 05 15 39 00 00    	mov    0x3915(%rip),%eax        # 45004 <showing.0>
           && processes[showing % NPROC].p_state == P_FREE) {
   416ef:	83 f8 20             	cmp    $0x20,%eax
   416f2:	7f 2e                	jg     41722 <memshow_virtual_animate+0x8a>
   416f4:	8b 05 0a 39 00 00    	mov    0x390a(%rip),%eax        # 45004 <showing.0>
   416fa:	99                   	cltd   
   416fb:	c1 ea 1c             	shr    $0x1c,%edx
   416fe:	01 d0                	add    %edx,%eax
   41700:	83 e0 0f             	and    $0xf,%eax
   41703:	29 d0                	sub    %edx,%eax
   41705:	48 63 d0             	movslq %eax,%rdx
   41708:	48 89 d0             	mov    %rdx,%rax
   4170b:	48 c1 e0 03          	shl    $0x3,%rax
   4170f:	48 29 d0             	sub    %rdx,%rax
   41712:	48 c1 e0 05          	shl    $0x5,%rax
   41716:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   4171c:	8b 00                	mov    (%rax),%eax
   4171e:	85 c0                	test   %eax,%eax
   41720:	74 b8                	je     416da <memshow_virtual_animate+0x42>
    }
    showing = showing % NPROC;
   41722:	8b 05 dc 38 00 00    	mov    0x38dc(%rip),%eax        # 45004 <showing.0>
   41728:	99                   	cltd   
   41729:	c1 ea 1c             	shr    $0x1c,%edx
   4172c:	01 d0                	add    %edx,%eax
   4172e:	83 e0 0f             	and    $0xf,%eax
   41731:	29 d0                	sub    %edx,%eax
   41733:	89 05 cb 38 00 00    	mov    %eax,0x38cb(%rip)        # 45004 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   41739:	8b 05 c5 38 00 00    	mov    0x38c5(%rip),%eax        # 45004 <showing.0>
   4173f:	48 63 d0             	movslq %eax,%rdx
   41742:	48 89 d0             	mov    %rdx,%rax
   41745:	48 c1 e0 03          	shl    $0x3,%rax
   41749:	48 29 d0             	sub    %rdx,%rax
   4174c:	48 c1 e0 05          	shl    $0x5,%rax
   41750:	48 05 e8 e0 04 00    	add    $0x4e0e8,%rax
   41756:	8b 00                	mov    (%rax),%eax
   41758:	85 c0                	test   %eax,%eax
   4175a:	74 52                	je     417ae <memshow_virtual_animate+0x116>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   4175c:	8b 15 a2 38 00 00    	mov    0x38a2(%rip),%edx        # 45004 <showing.0>
   41762:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41766:	89 d1                	mov    %edx,%ecx
   41768:	ba 64 3f 04 00       	mov    $0x43f64,%edx
   4176d:	be 04 00 00 00       	mov    $0x4,%esi
   41772:	48 89 c7             	mov    %rax,%rdi
   41775:	b8 00 00 00 00       	mov    $0x0,%eax
   4177a:	e8 77 23 00 00       	callq  43af6 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   4177f:	8b 05 7f 38 00 00    	mov    0x387f(%rip),%eax        # 45004 <showing.0>
   41785:	48 63 d0             	movslq %eax,%rdx
   41788:	48 89 d0             	mov    %rdx,%rax
   4178b:	48 c1 e0 03          	shl    $0x3,%rax
   4178f:	48 29 d0             	sub    %rdx,%rax
   41792:	48 c1 e0 05          	shl    $0x5,%rax
   41796:	48 05 f0 e0 04 00    	add    $0x4e0f0,%rax
   4179c:	48 8b 00             	mov    (%rax),%rax
   4179f:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   417a3:	48 89 d6             	mov    %rdx,%rsi
   417a6:	48 89 c7             	mov    %rax,%rdi
   417a9:	e8 f1 fc ff ff       	callq  4149f <memshow_virtual>
    }
}
   417ae:	90                   	nop
   417af:	c9                   	leaveq 
   417b0:	c3                   	retq   

00000000000417b1 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   417b1:	55                   	push   %rbp
   417b2:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   417b5:	e8 53 01 00 00       	callq  4190d <segments_init>
    interrupt_init();
   417ba:	e8 d4 03 00 00       	callq  41b93 <interrupt_init>
    virtual_memory_init();
   417bf:	e8 e7 0f 00 00       	callq  427ab <virtual_memory_init>
}
   417c4:	90                   	nop
   417c5:	5d                   	pop    %rbp
   417c6:	c3                   	retq   

00000000000417c7 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   417c7:	55                   	push   %rbp
   417c8:	48 89 e5             	mov    %rsp,%rbp
   417cb:	48 83 ec 18          	sub    $0x18,%rsp
   417cf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   417d3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   417d7:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   417da:	8b 45 ec             	mov    -0x14(%rbp),%eax
   417dd:	48 98                	cltq   
   417df:	48 c1 e0 2d          	shl    $0x2d,%rax
   417e3:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   417e7:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   417ee:	90 00 00 
   417f1:	48 09 c2             	or     %rax,%rdx
    *segment = type
   417f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417f8:	48 89 10             	mov    %rdx,(%rax)
}
   417fb:	90                   	nop
   417fc:	c9                   	leaveq 
   417fd:	c3                   	retq   

00000000000417fe <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   417fe:	55                   	push   %rbp
   417ff:	48 89 e5             	mov    %rsp,%rbp
   41802:	48 83 ec 28          	sub    $0x28,%rsp
   41806:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4180a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   4180e:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41811:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   41815:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41819:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4181d:	48 c1 e0 10          	shl    $0x10,%rax
   41821:	48 89 c2             	mov    %rax,%rdx
   41824:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   4182b:	00 00 00 
   4182e:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   41831:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41835:	48 c1 e0 20          	shl    $0x20,%rax
   41839:	48 89 c1             	mov    %rax,%rcx
   4183c:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   41843:	00 00 ff 
   41846:	48 21 c8             	and    %rcx,%rax
   41849:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   4184c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41850:	48 83 e8 01          	sub    $0x1,%rax
   41854:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   41857:	48 09 d0             	or     %rdx,%rax
        | type
   4185a:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   4185e:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41861:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41864:	48 98                	cltq   
   41866:	48 c1 e0 2d          	shl    $0x2d,%rax
   4186a:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   4186d:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   41874:	80 00 00 
   41877:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   4187a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4187e:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   41881:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41885:	48 83 c0 08          	add    $0x8,%rax
   41889:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4188d:	48 c1 ea 20          	shr    $0x20,%rdx
   41891:	48 89 10             	mov    %rdx,(%rax)
}
   41894:	90                   	nop
   41895:	c9                   	leaveq 
   41896:	c3                   	retq   

0000000000041897 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   41897:	55                   	push   %rbp
   41898:	48 89 e5             	mov    %rsp,%rbp
   4189b:	48 83 ec 20          	sub    $0x20,%rsp
   4189f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   418a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   418a7:	89 55 ec             	mov    %edx,-0x14(%rbp)
   418aa:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   418ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   418b2:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   418b5:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   418b9:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   418bc:	8b 45 ec             	mov    -0x14(%rbp),%eax
   418bf:	48 98                	cltq   
   418c1:	48 c1 e0 2d          	shl    $0x2d,%rax
   418c5:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   418c8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   418cc:	48 c1 e0 20          	shl    $0x20,%rax
   418d0:	48 89 c1             	mov    %rax,%rcx
   418d3:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   418da:	00 ff ff 
   418dd:	48 21 c8             	and    %rcx,%rax
   418e0:	48 09 c2             	or     %rax,%rdx
   418e3:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   418ea:	80 00 00 
   418ed:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   418f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   418f4:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   418f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   418fb:	48 c1 e8 20          	shr    $0x20,%rax
   418ff:	48 89 c2             	mov    %rax,%rdx
   41902:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41906:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   4190a:	90                   	nop
   4190b:	c9                   	leaveq 
   4190c:	c3                   	retq   

000000000004190d <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   4190d:	55                   	push   %rbp
   4190e:	48 89 e5             	mov    %rsp,%rbp
   41911:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   41915:	48 c7 05 40 d9 00 00 	movq   $0x0,0xd940(%rip)        # 4f260 <segments>
   4191c:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   41920:	ba 00 00 00 00       	mov    $0x0,%edx
   41925:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   4192c:	08 20 00 
   4192f:	48 89 c6             	mov    %rax,%rsi
   41932:	bf 68 f2 04 00       	mov    $0x4f268,%edi
   41937:	e8 8b fe ff ff       	callq  417c7 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   4193c:	ba 03 00 00 00       	mov    $0x3,%edx
   41941:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41948:	08 20 00 
   4194b:	48 89 c6             	mov    %rax,%rsi
   4194e:	bf 70 f2 04 00       	mov    $0x4f270,%edi
   41953:	e8 6f fe ff ff       	callq  417c7 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   41958:	ba 00 00 00 00       	mov    $0x0,%edx
   4195d:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41964:	02 00 00 
   41967:	48 89 c6             	mov    %rax,%rsi
   4196a:	bf 78 f2 04 00       	mov    $0x4f278,%edi
   4196f:	e8 53 fe ff ff       	callq  417c7 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   41974:	ba 03 00 00 00       	mov    $0x3,%edx
   41979:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41980:	02 00 00 
   41983:	48 89 c6             	mov    %rax,%rsi
   41986:	bf 80 f2 04 00       	mov    $0x4f280,%edi
   4198b:	e8 37 fe ff ff       	callq  417c7 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41990:	b8 a0 02 05 00       	mov    $0x502a0,%eax
   41995:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   4199b:	48 89 c1             	mov    %rax,%rcx
   4199e:	ba 00 00 00 00       	mov    $0x0,%edx
   419a3:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   419aa:	09 00 00 
   419ad:	48 89 c6             	mov    %rax,%rsi
   419b0:	bf 88 f2 04 00       	mov    $0x4f288,%edi
   419b5:	e8 44 fe ff ff       	callq  417fe <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   419ba:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   419c0:	b8 60 f2 04 00       	mov    $0x4f260,%eax
   419c5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   419c9:	ba 60 00 00 00       	mov    $0x60,%edx
   419ce:	be 00 00 00 00       	mov    $0x0,%esi
   419d3:	bf a0 02 05 00       	mov    $0x502a0,%edi
   419d8:	e8 66 18 00 00       	callq  43243 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   419dd:	48 c7 05 bc e8 00 00 	movq   $0x80000,0xe8bc(%rip)        # 502a4 <kernel_task_descriptor+0x4>
   419e4:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   419e8:	ba 00 10 00 00       	mov    $0x1000,%edx
   419ed:	be 00 00 00 00       	mov    $0x0,%esi
   419f2:	bf a0 f2 04 00       	mov    $0x4f2a0,%edi
   419f7:	e8 47 18 00 00       	callq  43243 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   419fc:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   41a03:	eb 30                	jmp    41a35 <segments_init+0x128>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41a05:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   41a0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41a0d:	48 c1 e0 04          	shl    $0x4,%rax
   41a11:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   41a17:	48 89 d1             	mov    %rdx,%rcx
   41a1a:	ba 00 00 00 00       	mov    $0x0,%edx
   41a1f:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41a26:	0e 00 00 
   41a29:	48 89 c7             	mov    %rax,%rdi
   41a2c:	e8 66 fe ff ff       	callq  41897 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41a31:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41a35:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   41a3c:	76 c7                	jbe    41a05 <segments_init+0xf8>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   41a3e:	b8 36 00 04 00       	mov    $0x40036,%eax
   41a43:	48 89 c1             	mov    %rax,%rcx
   41a46:	ba 00 00 00 00       	mov    $0x0,%edx
   41a4b:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41a52:	0e 00 00 
   41a55:	48 89 c6             	mov    %rax,%rsi
   41a58:	bf a0 f4 04 00       	mov    $0x4f4a0,%edi
   41a5d:	e8 35 fe ff ff       	callq  41897 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   41a62:	b8 2e 00 04 00       	mov    $0x4002e,%eax
   41a67:	48 89 c1             	mov    %rax,%rcx
   41a6a:	ba 00 00 00 00       	mov    $0x0,%edx
   41a6f:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41a76:	0e 00 00 
   41a79:	48 89 c6             	mov    %rax,%rsi
   41a7c:	bf 70 f3 04 00       	mov    $0x4f370,%edi
   41a81:	e8 11 fe ff ff       	callq  41897 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   41a86:	b8 32 00 04 00       	mov    $0x40032,%eax
   41a8b:	48 89 c1             	mov    %rax,%rcx
   41a8e:	ba 00 00 00 00       	mov    $0x0,%edx
   41a93:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41a9a:	0e 00 00 
   41a9d:	48 89 c6             	mov    %rax,%rsi
   41aa0:	bf 80 f3 04 00       	mov    $0x4f380,%edi
   41aa5:	e8 ed fd ff ff       	callq  41897 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41aaa:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   41ab1:	eb 3e                	jmp    41af1 <segments_init+0x1e4>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   41ab3:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41ab6:	83 e8 30             	sub    $0x30,%eax
   41ab9:	89 c0                	mov    %eax,%eax
   41abb:	48 8b 04 c5 e7 00 04 	mov    0x400e7(,%rax,8),%rax
   41ac2:	00 
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   41ac3:	48 89 c2             	mov    %rax,%rdx
   41ac6:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41ac9:	48 c1 e0 04          	shl    $0x4,%rax
   41acd:	48 05 a0 f2 04 00    	add    $0x4f2a0,%rax
   41ad3:	48 89 d1             	mov    %rdx,%rcx
   41ad6:	ba 03 00 00 00       	mov    $0x3,%edx
   41adb:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41ae2:	0e 00 00 
   41ae5:	48 89 c7             	mov    %rax,%rdi
   41ae8:	e8 aa fd ff ff       	callq  41897 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41aed:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41af1:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   41af5:	76 bc                	jbe    41ab3 <segments_init+0x1a6>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   41af7:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   41afd:	b8 a0 f2 04 00       	mov    $0x4f2a0,%eax
   41b02:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   41b06:	b8 28 00 00 00       	mov    $0x28,%eax
   41b0b:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   41b0f:	0f 00 d8             	ltr    %ax
   41b12:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   41b16:	0f 20 c0             	mov    %cr0,%rax
   41b19:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   41b1d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   41b21:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   41b24:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   41b2b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41b2e:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   41b31:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41b34:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   41b38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41b3c:	0f 22 c0             	mov    %rax,%cr0
}
   41b3f:	90                   	nop
    lcr0(cr0);
}
   41b40:	90                   	nop
   41b41:	c9                   	leaveq 
   41b42:	c3                   	retq   

0000000000041b43 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   41b43:	55                   	push   %rbp
   41b44:	48 89 e5             	mov    %rsp,%rbp
   41b47:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   41b4b:	0f b7 05 ae e7 00 00 	movzwl 0xe7ae(%rip),%eax        # 50300 <interrupts_enabled>
   41b52:	f7 d0                	not    %eax
   41b54:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   41b58:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41b5c:	0f b6 c0             	movzbl %al,%eax
   41b5f:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   41b66:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41b69:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   41b6d:	8b 55 f0             	mov    -0x10(%rbp),%edx
   41b70:	ee                   	out    %al,(%dx)
}
   41b71:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   41b72:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41b76:	66 c1 e8 08          	shr    $0x8,%ax
   41b7a:	0f b6 c0             	movzbl %al,%eax
   41b7d:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   41b84:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41b87:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   41b8b:	8b 55 f8             	mov    -0x8(%rbp),%edx
   41b8e:	ee                   	out    %al,(%dx)
}
   41b8f:	90                   	nop
}
   41b90:	90                   	nop
   41b91:	c9                   	leaveq 
   41b92:	c3                   	retq   

0000000000041b93 <interrupt_init>:

void interrupt_init(void) {
   41b93:	55                   	push   %rbp
   41b94:	48 89 e5             	mov    %rsp,%rbp
   41b97:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   41b9b:	66 c7 05 5c e7 00 00 	movw   $0x0,0xe75c(%rip)        # 50300 <interrupts_enabled>
   41ba2:	00 00 
    interrupt_mask();
   41ba4:	e8 9a ff ff ff       	callq  41b43 <interrupt_mask>
   41ba9:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   41bb0:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41bb4:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   41bb8:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   41bbb:	ee                   	out    %al,(%dx)
}
   41bbc:	90                   	nop
   41bbd:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   41bc4:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41bc8:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   41bcc:	8b 55 ac             	mov    -0x54(%rbp),%edx
   41bcf:	ee                   	out    %al,(%dx)
}
   41bd0:	90                   	nop
   41bd1:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   41bd8:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41bdc:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   41be0:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   41be3:	ee                   	out    %al,(%dx)
}
   41be4:	90                   	nop
   41be5:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   41bec:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41bf0:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   41bf4:	8b 55 bc             	mov    -0x44(%rbp),%edx
   41bf7:	ee                   	out    %al,(%dx)
}
   41bf8:	90                   	nop
   41bf9:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   41c00:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c04:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   41c08:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   41c0b:	ee                   	out    %al,(%dx)
}
   41c0c:	90                   	nop
   41c0d:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   41c14:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c18:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   41c1c:	8b 55 cc             	mov    -0x34(%rbp),%edx
   41c1f:	ee                   	out    %al,(%dx)
}
   41c20:	90                   	nop
   41c21:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   41c28:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c2c:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   41c30:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   41c33:	ee                   	out    %al,(%dx)
}
   41c34:	90                   	nop
   41c35:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   41c3c:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c40:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   41c44:	8b 55 dc             	mov    -0x24(%rbp),%edx
   41c47:	ee                   	out    %al,(%dx)
}
   41c48:	90                   	nop
   41c49:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   41c50:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c54:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   41c58:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   41c5b:	ee                   	out    %al,(%dx)
}
   41c5c:	90                   	nop
   41c5d:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   41c64:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c68:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41c6c:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41c6f:	ee                   	out    %al,(%dx)
}
   41c70:	90                   	nop
   41c71:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   41c78:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c7c:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41c80:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41c83:	ee                   	out    %al,(%dx)
}
   41c84:	90                   	nop
   41c85:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   41c8c:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c90:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41c94:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41c97:	ee                   	out    %al,(%dx)
}
   41c98:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   41c99:	e8 a5 fe ff ff       	callq  41b43 <interrupt_mask>
}
   41c9e:	90                   	nop
   41c9f:	c9                   	leaveq 
   41ca0:	c3                   	retq   

0000000000041ca1 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   41ca1:	55                   	push   %rbp
   41ca2:	48 89 e5             	mov    %rsp,%rbp
   41ca5:	48 83 ec 28          	sub    $0x28,%rsp
   41ca9:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   41cac:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   41cb0:	0f 8e 9f 00 00 00    	jle    41d55 <timer_init+0xb4>
   41cb6:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   41cbd:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41cc1:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41cc5:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41cc8:	ee                   	out    %al,(%dx)
}
   41cc9:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   41cca:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41ccd:	89 c2                	mov    %eax,%edx
   41ccf:	c1 ea 1f             	shr    $0x1f,%edx
   41cd2:	01 d0                	add    %edx,%eax
   41cd4:	d1 f8                	sar    %eax
   41cd6:	05 de 34 12 00       	add    $0x1234de,%eax
   41cdb:	99                   	cltd   
   41cdc:	f7 7d dc             	idivl  -0x24(%rbp)
   41cdf:	89 c2                	mov    %eax,%edx
   41ce1:	89 d0                	mov    %edx,%eax
   41ce3:	c1 f8 1f             	sar    $0x1f,%eax
   41ce6:	c1 e8 18             	shr    $0x18,%eax
   41ce9:	89 c1                	mov    %eax,%ecx
   41ceb:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   41cee:	0f b6 c0             	movzbl %al,%eax
   41cf1:	29 c8                	sub    %ecx,%eax
   41cf3:	0f b6 c0             	movzbl %al,%eax
   41cf6:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   41cfd:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d00:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41d04:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41d07:	ee                   	out    %al,(%dx)
}
   41d08:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   41d09:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41d0c:	89 c2                	mov    %eax,%edx
   41d0e:	c1 ea 1f             	shr    $0x1f,%edx
   41d11:	01 d0                	add    %edx,%eax
   41d13:	d1 f8                	sar    %eax
   41d15:	05 de 34 12 00       	add    $0x1234de,%eax
   41d1a:	99                   	cltd   
   41d1b:	f7 7d dc             	idivl  -0x24(%rbp)
   41d1e:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   41d24:	85 c0                	test   %eax,%eax
   41d26:	0f 48 c2             	cmovs  %edx,%eax
   41d29:	c1 f8 08             	sar    $0x8,%eax
   41d2c:	0f b6 c0             	movzbl %al,%eax
   41d2f:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   41d36:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d39:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41d3d:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41d40:	ee                   	out    %al,(%dx)
}
   41d41:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   41d42:	0f b7 05 b7 e5 00 00 	movzwl 0xe5b7(%rip),%eax        # 50300 <interrupts_enabled>
   41d49:	83 c8 01             	or     $0x1,%eax
   41d4c:	66 89 05 ad e5 00 00 	mov    %ax,0xe5ad(%rip)        # 50300 <interrupts_enabled>
   41d53:	eb 11                	jmp    41d66 <timer_init+0xc5>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   41d55:	0f b7 05 a4 e5 00 00 	movzwl 0xe5a4(%rip),%eax        # 50300 <interrupts_enabled>
   41d5c:	83 e0 fe             	and    $0xfffffffe,%eax
   41d5f:	66 89 05 9a e5 00 00 	mov    %ax,0xe59a(%rip)        # 50300 <interrupts_enabled>
    }
    interrupt_mask();
   41d66:	e8 d8 fd ff ff       	callq  41b43 <interrupt_mask>
}
   41d6b:	90                   	nop
   41d6c:	c9                   	leaveq 
   41d6d:	c3                   	retq   

0000000000041d6e <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   41d6e:	55                   	push   %rbp
   41d6f:	48 89 e5             	mov    %rsp,%rbp
   41d72:	48 83 ec 08          	sub    $0x8,%rsp
   41d76:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   41d7a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   41d7f:	74 14                	je     41d95 <physical_memory_isreserved+0x27>
   41d81:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   41d88:	00 
   41d89:	76 11                	jbe    41d9c <physical_memory_isreserved+0x2e>
   41d8b:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   41d92:	00 
   41d93:	77 07                	ja     41d9c <physical_memory_isreserved+0x2e>
   41d95:	b8 01 00 00 00       	mov    $0x1,%eax
   41d9a:	eb 05                	jmp    41da1 <physical_memory_isreserved+0x33>
   41d9c:	b8 00 00 00 00       	mov    $0x0,%eax
}
   41da1:	c9                   	leaveq 
   41da2:	c3                   	retq   

0000000000041da3 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   41da3:	55                   	push   %rbp
   41da4:	48 89 e5             	mov    %rsp,%rbp
   41da7:	48 83 ec 10          	sub    $0x10,%rsp
   41dab:	89 7d fc             	mov    %edi,-0x4(%rbp)
   41dae:	89 75 f8             	mov    %esi,-0x8(%rbp)
   41db1:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   41db4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41db7:	c1 e0 10             	shl    $0x10,%eax
   41dba:	89 c2                	mov    %eax,%edx
   41dbc:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41dbf:	c1 e0 0b             	shl    $0xb,%eax
   41dc2:	09 c2                	or     %eax,%edx
   41dc4:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41dc7:	c1 e0 08             	shl    $0x8,%eax
   41dca:	09 d0                	or     %edx,%eax
}
   41dcc:	c9                   	leaveq 
   41dcd:	c3                   	retq   

0000000000041dce <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   41dce:	55                   	push   %rbp
   41dcf:	48 89 e5             	mov    %rsp,%rbp
   41dd2:	48 83 ec 18          	sub    $0x18,%rsp
   41dd6:	89 7d ec             	mov    %edi,-0x14(%rbp)
   41dd9:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   41ddc:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41ddf:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41de2:	09 d0                	or     %edx,%eax
   41de4:	0d 00 00 00 80       	or     $0x80000000,%eax
   41de9:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   41df0:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   41df3:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41df6:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41df9:	ef                   	out    %eax,(%dx)
}
   41dfa:	90                   	nop
   41dfb:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   41e02:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e05:	89 c2                	mov    %eax,%edx
   41e07:	ed                   	in     (%dx),%eax
   41e08:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   41e0b:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   41e0e:	c9                   	leaveq 
   41e0f:	c3                   	retq   

0000000000041e10 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   41e10:	55                   	push   %rbp
   41e11:	48 89 e5             	mov    %rsp,%rbp
   41e14:	48 83 ec 28          	sub    $0x28,%rsp
   41e18:	89 7d dc             	mov    %edi,-0x24(%rbp)
   41e1b:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   41e1e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41e25:	eb 73                	jmp    41e9a <pci_find_device+0x8a>
        for (int slot = 0; slot != 32; ++slot) {
   41e27:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41e2e:	eb 60                	jmp    41e90 <pci_find_device+0x80>
            for (int func = 0; func != 8; ++func) {
   41e30:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41e37:	eb 4a                	jmp    41e83 <pci_find_device+0x73>
                int configaddr = pci_make_configaddr(bus, slot, func);
   41e39:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41e3c:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41e3f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e42:	89 ce                	mov    %ecx,%esi
   41e44:	89 c7                	mov    %eax,%edi
   41e46:	e8 58 ff ff ff       	callq  41da3 <pci_make_configaddr>
   41e4b:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   41e4e:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41e51:	be 00 00 00 00       	mov    $0x0,%esi
   41e56:	89 c7                	mov    %eax,%edi
   41e58:	e8 71 ff ff ff       	callq  41dce <pci_config_readl>
   41e5d:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   41e60:	8b 45 d8             	mov    -0x28(%rbp),%eax
   41e63:	c1 e0 10             	shl    $0x10,%eax
   41e66:	0b 45 dc             	or     -0x24(%rbp),%eax
   41e69:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   41e6c:	75 05                	jne    41e73 <pci_find_device+0x63>
                    return configaddr;
   41e6e:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41e71:	eb 35                	jmp    41ea8 <pci_find_device+0x98>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   41e73:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   41e77:	75 06                	jne    41e7f <pci_find_device+0x6f>
   41e79:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41e7d:	74 0c                	je     41e8b <pci_find_device+0x7b>
            for (int func = 0; func != 8; ++func) {
   41e7f:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   41e83:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   41e87:	75 b0                	jne    41e39 <pci_find_device+0x29>
   41e89:	eb 01                	jmp    41e8c <pci_find_device+0x7c>
                    break;
   41e8b:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   41e8c:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41e90:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   41e94:	75 9a                	jne    41e30 <pci_find_device+0x20>
    for (int bus = 0; bus != 256; ++bus) {
   41e96:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41e9a:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   41ea1:	75 84                	jne    41e27 <pci_find_device+0x17>
                }
            }
        }
    }
    return -1;
   41ea3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   41ea8:	c9                   	leaveq 
   41ea9:	c3                   	retq   

0000000000041eaa <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   41eaa:	55                   	push   %rbp
   41eab:	48 89 e5             	mov    %rsp,%rbp
   41eae:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   41eb2:	be 13 71 00 00       	mov    $0x7113,%esi
   41eb7:	bf 86 80 00 00       	mov    $0x8086,%edi
   41ebc:	e8 4f ff ff ff       	callq  41e10 <pci_find_device>
   41ec1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   41ec4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   41ec8:	78 30                	js     41efa <poweroff+0x50>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   41eca:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ecd:	be 40 00 00 00       	mov    $0x40,%esi
   41ed2:	89 c7                	mov    %eax,%edi
   41ed4:	e8 f5 fe ff ff       	callq  41dce <pci_config_readl>
   41ed9:	25 c0 ff 00 00       	and    $0xffc0,%eax
   41ede:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   41ee1:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41ee4:	83 c0 04             	add    $0x4,%eax
   41ee7:	89 45 f4             	mov    %eax,-0xc(%rbp)
   41eea:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   41ef0:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   41ef4:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41ef7:	66 ef                	out    %ax,(%dx)
}
   41ef9:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   41efa:	ba 80 3f 04 00       	mov    $0x43f80,%edx
   41eff:	be 00 c0 00 00       	mov    $0xc000,%esi
   41f04:	bf 80 07 00 00       	mov    $0x780,%edi
   41f09:	b8 00 00 00 00       	mov    $0x0,%eax
   41f0e:	e8 65 1b 00 00       	callq  43a78 <console_printf>
 spinloop: goto spinloop;
   41f13:	eb fe                	jmp    41f13 <poweroff+0x69>

0000000000041f15 <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   41f15:	55                   	push   %rbp
   41f16:	48 89 e5             	mov    %rsp,%rbp
   41f19:	48 83 ec 10          	sub    $0x10,%rsp
   41f1d:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   41f24:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41f28:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41f2c:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41f2f:	ee                   	out    %al,(%dx)
}
   41f30:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   41f31:	eb fe                	jmp    41f31 <reboot+0x1c>

0000000000041f33 <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   41f33:	55                   	push   %rbp
   41f34:	48 89 e5             	mov    %rsp,%rbp
   41f37:	48 83 ec 10          	sub    $0x10,%rsp
   41f3b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41f3f:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   41f42:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f46:	48 83 c0 08          	add    $0x8,%rax
   41f4a:	ba c0 00 00 00       	mov    $0xc0,%edx
   41f4f:	be 00 00 00 00       	mov    $0x0,%esi
   41f54:	48 89 c7             	mov    %rax,%rdi
   41f57:	e8 e7 12 00 00       	callq  43243 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   41f5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f60:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   41f67:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   41f69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f6d:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   41f74:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   41f78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f7c:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   41f83:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   41f87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f8b:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   41f92:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   41f94:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f98:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   41f9f:	00 02 00 00 

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   41fa3:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41fa6:	83 e0 01             	and    $0x1,%eax
   41fa9:	85 c0                	test   %eax,%eax
   41fab:	74 1c                	je     41fc9 <process_init+0x96>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   41fad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fb1:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   41fb8:	80 cc 30             	or     $0x30,%ah
   41fbb:	48 89 c2             	mov    %rax,%rdx
   41fbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fc2:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   41fc9:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41fcc:	83 e0 02             	and    $0x2,%eax
   41fcf:	85 c0                	test   %eax,%eax
   41fd1:	74 1c                	je     41fef <process_init+0xbc>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   41fd3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fd7:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   41fde:	80 e4 fd             	and    $0xfd,%ah
   41fe1:	48 89 c2             	mov    %rax,%rdx
   41fe4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fe8:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   41fef:	90                   	nop
   41ff0:	c9                   	leaveq 
   41ff1:	c3                   	retq   

0000000000041ff2 <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   41ff2:	55                   	push   %rbp
   41ff3:	48 89 e5             	mov    %rsp,%rbp
   41ff6:	48 83 ec 28          	sub    $0x28,%rsp
   41ffa:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   41ffd:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42001:	78 09                	js     4200c <console_show_cursor+0x1a>
   42003:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   4200a:	7e 07                	jle    42013 <console_show_cursor+0x21>
        cpos = 0;
   4200c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   42013:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   4201a:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4201e:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   42022:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   42025:	ee                   	out    %al,(%dx)
}
   42026:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   42027:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4202a:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   42030:	85 c0                	test   %eax,%eax
   42032:	0f 48 c2             	cmovs  %edx,%eax
   42035:	c1 f8 08             	sar    $0x8,%eax
   42038:	0f b6 c0             	movzbl %al,%eax
   4203b:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   42042:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42045:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42049:	8b 55 ec             	mov    -0x14(%rbp),%edx
   4204c:	ee                   	out    %al,(%dx)
}
   4204d:	90                   	nop
   4204e:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   42055:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42059:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   4205d:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42060:	ee                   	out    %al,(%dx)
}
   42061:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   42062:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42065:	99                   	cltd   
   42066:	c1 ea 18             	shr    $0x18,%edx
   42069:	01 d0                	add    %edx,%eax
   4206b:	0f b6 c0             	movzbl %al,%eax
   4206e:	29 d0                	sub    %edx,%eax
   42070:	0f b6 c0             	movzbl %al,%eax
   42073:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   4207a:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4207d:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42081:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42084:	ee                   	out    %al,(%dx)
}
   42085:	90                   	nop
}
   42086:	90                   	nop
   42087:	c9                   	leaveq 
   42088:	c3                   	retq   

0000000000042089 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42089:	55                   	push   %rbp
   4208a:	48 89 e5             	mov    %rsp,%rbp
   4208d:	48 83 ec 20          	sub    $0x20,%rsp
   42091:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42098:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4209b:	89 c2                	mov    %eax,%edx
   4209d:	ec                   	in     (%dx),%al
   4209e:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   420a1:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   420a5:	0f b6 c0             	movzbl %al,%eax
   420a8:	83 e0 01             	and    $0x1,%eax
   420ab:	85 c0                	test   %eax,%eax
   420ad:	75 0a                	jne    420b9 <keyboard_readc+0x30>
        return -1;
   420af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   420b4:	e9 e7 01 00 00       	jmpq   422a0 <keyboard_readc+0x217>
   420b9:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   420c0:	8b 45 e8             	mov    -0x18(%rbp),%eax
   420c3:	89 c2                	mov    %eax,%edx
   420c5:	ec                   	in     (%dx),%al
   420c6:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   420c9:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   420cd:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   420d0:	0f b6 05 2b e2 00 00 	movzbl 0xe22b(%rip),%eax        # 50302 <last_escape.2>
   420d7:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   420da:	c6 05 21 e2 00 00 00 	movb   $0x0,0xe221(%rip)        # 50302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   420e1:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   420e5:	75 11                	jne    420f8 <keyboard_readc+0x6f>
        last_escape = 0x80;
   420e7:	c6 05 14 e2 00 00 80 	movb   $0x80,0xe214(%rip)        # 50302 <last_escape.2>
        return 0;
   420ee:	b8 00 00 00 00       	mov    $0x0,%eax
   420f3:	e9 a8 01 00 00       	jmpq   422a0 <keyboard_readc+0x217>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   420f8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   420fc:	84 c0                	test   %al,%al
   420fe:	79 60                	jns    42160 <keyboard_readc+0xd7>
        int ch = keymap[(data & 0x7F) | escape];
   42100:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42104:	83 e0 7f             	and    $0x7f,%eax
   42107:	89 c2                	mov    %eax,%edx
   42109:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   4210d:	09 d0                	or     %edx,%eax
   4210f:	48 98                	cltq   
   42111:	0f b6 80 a0 3f 04 00 	movzbl 0x43fa0(%rax),%eax
   42118:	0f b6 c0             	movzbl %al,%eax
   4211b:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   4211e:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   42125:	7e 2f                	jle    42156 <keyboard_readc+0xcd>
   42127:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   4212e:	7f 26                	jg     42156 <keyboard_readc+0xcd>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   42130:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42133:	2d fa 00 00 00       	sub    $0xfa,%eax
   42138:	ba 01 00 00 00       	mov    $0x1,%edx
   4213d:	89 c1                	mov    %eax,%ecx
   4213f:	d3 e2                	shl    %cl,%edx
   42141:	89 d0                	mov    %edx,%eax
   42143:	f7 d0                	not    %eax
   42145:	89 c2                	mov    %eax,%edx
   42147:	0f b6 05 b5 e1 00 00 	movzbl 0xe1b5(%rip),%eax        # 50303 <modifiers.1>
   4214e:	21 d0                	and    %edx,%eax
   42150:	88 05 ad e1 00 00    	mov    %al,0xe1ad(%rip)        # 50303 <modifiers.1>
        }
        return 0;
   42156:	b8 00 00 00 00       	mov    $0x0,%eax
   4215b:	e9 40 01 00 00       	jmpq   422a0 <keyboard_readc+0x217>
    }

    int ch = (unsigned char) keymap[data | escape];
   42160:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42164:	0a 45 fa             	or     -0x6(%rbp),%al
   42167:	0f b6 c0             	movzbl %al,%eax
   4216a:	48 98                	cltq   
   4216c:	0f b6 80 a0 3f 04 00 	movzbl 0x43fa0(%rax),%eax
   42173:	0f b6 c0             	movzbl %al,%eax
   42176:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   42179:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   4217d:	7e 57                	jle    421d6 <keyboard_readc+0x14d>
   4217f:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   42183:	7f 51                	jg     421d6 <keyboard_readc+0x14d>
        if (modifiers & MOD_CONTROL) {
   42185:	0f b6 05 77 e1 00 00 	movzbl 0xe177(%rip),%eax        # 50303 <modifiers.1>
   4218c:	0f b6 c0             	movzbl %al,%eax
   4218f:	83 e0 02             	and    $0x2,%eax
   42192:	85 c0                	test   %eax,%eax
   42194:	74 09                	je     4219f <keyboard_readc+0x116>
            ch -= 0x60;
   42196:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   4219a:	e9 fd 00 00 00       	jmpq   4229c <keyboard_readc+0x213>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   4219f:	0f b6 05 5d e1 00 00 	movzbl 0xe15d(%rip),%eax        # 50303 <modifiers.1>
   421a6:	0f b6 c0             	movzbl %al,%eax
   421a9:	83 e0 01             	and    $0x1,%eax
   421ac:	85 c0                	test   %eax,%eax
   421ae:	0f 94 c2             	sete   %dl
   421b1:	0f b6 05 4b e1 00 00 	movzbl 0xe14b(%rip),%eax        # 50303 <modifiers.1>
   421b8:	0f b6 c0             	movzbl %al,%eax
   421bb:	83 e0 08             	and    $0x8,%eax
   421be:	85 c0                	test   %eax,%eax
   421c0:	0f 94 c0             	sete   %al
   421c3:	31 d0                	xor    %edx,%eax
   421c5:	84 c0                	test   %al,%al
   421c7:	0f 84 cf 00 00 00    	je     4229c <keyboard_readc+0x213>
            ch -= 0x20;
   421cd:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   421d1:	e9 c6 00 00 00       	jmpq   4229c <keyboard_readc+0x213>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   421d6:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   421dd:	7e 30                	jle    4220f <keyboard_readc+0x186>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   421df:	8b 45 fc             	mov    -0x4(%rbp),%eax
   421e2:	2d fa 00 00 00       	sub    $0xfa,%eax
   421e7:	ba 01 00 00 00       	mov    $0x1,%edx
   421ec:	89 c1                	mov    %eax,%ecx
   421ee:	d3 e2                	shl    %cl,%edx
   421f0:	89 d0                	mov    %edx,%eax
   421f2:	89 c2                	mov    %eax,%edx
   421f4:	0f b6 05 08 e1 00 00 	movzbl 0xe108(%rip),%eax        # 50303 <modifiers.1>
   421fb:	31 d0                	xor    %edx,%eax
   421fd:	88 05 00 e1 00 00    	mov    %al,0xe100(%rip)        # 50303 <modifiers.1>
        ch = 0;
   42203:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4220a:	e9 8e 00 00 00       	jmpq   4229d <keyboard_readc+0x214>
    } else if (ch >= KEY_SHIFT) {
   4220f:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   42216:	7e 2d                	jle    42245 <keyboard_readc+0x1bc>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42218:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4221b:	2d fa 00 00 00       	sub    $0xfa,%eax
   42220:	ba 01 00 00 00       	mov    $0x1,%edx
   42225:	89 c1                	mov    %eax,%ecx
   42227:	d3 e2                	shl    %cl,%edx
   42229:	89 d0                	mov    %edx,%eax
   4222b:	89 c2                	mov    %eax,%edx
   4222d:	0f b6 05 cf e0 00 00 	movzbl 0xe0cf(%rip),%eax        # 50303 <modifiers.1>
   42234:	09 d0                	or     %edx,%eax
   42236:	88 05 c7 e0 00 00    	mov    %al,0xe0c7(%rip)        # 50303 <modifiers.1>
        ch = 0;
   4223c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42243:	eb 58                	jmp    4229d <keyboard_readc+0x214>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   42245:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42249:	7e 31                	jle    4227c <keyboard_readc+0x1f3>
   4224b:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   42252:	7f 28                	jg     4227c <keyboard_readc+0x1f3>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   42254:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42257:	8d 50 80             	lea    -0x80(%rax),%edx
   4225a:	0f b6 05 a2 e0 00 00 	movzbl 0xe0a2(%rip),%eax        # 50303 <modifiers.1>
   42261:	0f b6 c0             	movzbl %al,%eax
   42264:	83 e0 03             	and    $0x3,%eax
   42267:	48 98                	cltq   
   42269:	48 63 d2             	movslq %edx,%rdx
   4226c:	0f b6 84 90 a0 40 04 	movzbl 0x440a0(%rax,%rdx,4),%eax
   42273:	00 
   42274:	0f b6 c0             	movzbl %al,%eax
   42277:	89 45 fc             	mov    %eax,-0x4(%rbp)
   4227a:	eb 21                	jmp    4229d <keyboard_readc+0x214>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   4227c:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42280:	7f 1b                	jg     4229d <keyboard_readc+0x214>
   42282:	0f b6 05 7a e0 00 00 	movzbl 0xe07a(%rip),%eax        # 50303 <modifiers.1>
   42289:	0f b6 c0             	movzbl %al,%eax
   4228c:	83 e0 02             	and    $0x2,%eax
   4228f:	85 c0                	test   %eax,%eax
   42291:	74 0a                	je     4229d <keyboard_readc+0x214>
        ch = 0;
   42293:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4229a:	eb 01                	jmp    4229d <keyboard_readc+0x214>
        if (modifiers & MOD_CONTROL) {
   4229c:	90                   	nop
    }

    return ch;
   4229d:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   422a0:	c9                   	leaveq 
   422a1:	c3                   	retq   

00000000000422a2 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   422a2:	55                   	push   %rbp
   422a3:	48 89 e5             	mov    %rsp,%rbp
   422a6:	48 83 ec 20          	sub    $0x20,%rsp
   422aa:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   422b1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   422b4:	89 c2                	mov    %eax,%edx
   422b6:	ec                   	in     (%dx),%al
   422b7:	88 45 e3             	mov    %al,-0x1d(%rbp)
   422ba:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   422c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
   422c4:	89 c2                	mov    %eax,%edx
   422c6:	ec                   	in     (%dx),%al
   422c7:	88 45 eb             	mov    %al,-0x15(%rbp)
   422ca:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   422d1:	8b 45 f4             	mov    -0xc(%rbp),%eax
   422d4:	89 c2                	mov    %eax,%edx
   422d6:	ec                   	in     (%dx),%al
   422d7:	88 45 f3             	mov    %al,-0xd(%rbp)
   422da:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   422e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422e4:	89 c2                	mov    %eax,%edx
   422e6:	ec                   	in     (%dx),%al
   422e7:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   422ea:	90                   	nop
   422eb:	c9                   	leaveq 
   422ec:	c3                   	retq   

00000000000422ed <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   422ed:	55                   	push   %rbp
   422ee:	48 89 e5             	mov    %rsp,%rbp
   422f1:	48 83 ec 40          	sub    $0x40,%rsp
   422f5:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   422f9:	89 f0                	mov    %esi,%eax
   422fb:	89 55 c0             	mov    %edx,-0x40(%rbp)
   422fe:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   42301:	8b 05 fd df 00 00    	mov    0xdffd(%rip),%eax        # 50304 <initialized.0>
   42307:	85 c0                	test   %eax,%eax
   42309:	75 1e                	jne    42329 <parallel_port_putc+0x3c>
   4230b:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   42312:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42316:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4231a:	8b 55 f8             	mov    -0x8(%rbp),%edx
   4231d:	ee                   	out    %al,(%dx)
}
   4231e:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   4231f:	c7 05 db df 00 00 01 	movl   $0x1,0xdfdb(%rip)        # 50304 <initialized.0>
   42326:	00 00 00 
    }

    for (int i = 0;
   42329:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42330:	eb 09                	jmp    4233b <parallel_port_putc+0x4e>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   42332:	e8 6b ff ff ff       	callq  422a2 <delay>
         ++i) {
   42337:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   4233b:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   42342:	7f 18                	jg     4235c <parallel_port_putc+0x6f>
   42344:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4234b:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4234e:	89 c2                	mov    %eax,%edx
   42350:	ec                   	in     (%dx),%al
   42351:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42354:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42358:	84 c0                	test   %al,%al
   4235a:	79 d6                	jns    42332 <parallel_port_putc+0x45>
    }
    outb(IO_PARALLEL1_DATA, c);
   4235c:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   42360:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   42367:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4236a:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   4236e:	8b 55 d8             	mov    -0x28(%rbp),%edx
   42371:	ee                   	out    %al,(%dx)
}
   42372:	90                   	nop
   42373:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   4237a:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4237e:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   42382:	8b 55 e0             	mov    -0x20(%rbp),%edx
   42385:	ee                   	out    %al,(%dx)
}
   42386:	90                   	nop
   42387:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   4238e:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42392:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   42396:	8b 55 e8             	mov    -0x18(%rbp),%edx
   42399:	ee                   	out    %al,(%dx)
}
   4239a:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   4239b:	90                   	nop
   4239c:	c9                   	leaveq 
   4239d:	c3                   	retq   

000000000004239e <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   4239e:	55                   	push   %rbp
   4239f:	48 89 e5             	mov    %rsp,%rbp
   423a2:	48 83 ec 20          	sub    $0x20,%rsp
   423a6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   423aa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   423ae:	48 c7 45 f8 ed 22 04 	movq   $0x422ed,-0x8(%rbp)
   423b5:	00 
    printer_vprintf(&p, 0, format, val);
   423b6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   423ba:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   423be:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   423c2:	be 00 00 00 00       	mov    $0x0,%esi
   423c7:	48 89 c7             	mov    %rax,%rdi
   423ca:	e8 85 0f 00 00       	callq  43354 <printer_vprintf>
}
   423cf:	90                   	nop
   423d0:	c9                   	leaveq 
   423d1:	c3                   	retq   

00000000000423d2 <log_printf>:

void log_printf(const char* format, ...) {
   423d2:	55                   	push   %rbp
   423d3:	48 89 e5             	mov    %rsp,%rbp
   423d6:	48 83 ec 60          	sub    $0x60,%rsp
   423da:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   423de:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   423e2:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   423e6:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   423ea:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   423ee:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   423f2:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   423f9:	48 8d 45 10          	lea    0x10(%rbp),%rax
   423fd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42401:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42405:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   42409:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   4240d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   42411:	48 89 d6             	mov    %rdx,%rsi
   42414:	48 89 c7             	mov    %rax,%rdi
   42417:	e8 82 ff ff ff       	callq  4239e <log_vprintf>
    va_end(val);
}
   4241c:	90                   	nop
   4241d:	c9                   	leaveq 
   4241e:	c3                   	retq   

000000000004241f <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   4241f:	55                   	push   %rbp
   42420:	48 89 e5             	mov    %rsp,%rbp
   42423:	48 83 ec 40          	sub    $0x40,%rsp
   42427:	89 7d dc             	mov    %edi,-0x24(%rbp)
   4242a:	89 75 d8             	mov    %esi,-0x28(%rbp)
   4242d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   42431:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   42435:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   42439:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   4243d:	48 8b 0a             	mov    (%rdx),%rcx
   42440:	48 89 08             	mov    %rcx,(%rax)
   42443:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   42447:	48 89 48 08          	mov    %rcx,0x8(%rax)
   4244b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   4244f:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   42453:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   42457:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4245b:	48 89 d6             	mov    %rdx,%rsi
   4245e:	48 89 c7             	mov    %rax,%rdi
   42461:	e8 38 ff ff ff       	callq  4239e <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   42466:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   4246a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   4246e:	8b 75 d8             	mov    -0x28(%rbp),%esi
   42471:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42474:	89 c7                	mov    %eax,%edi
   42476:	e8 b8 15 00 00       	callq  43a33 <console_vprintf>
}
   4247b:	c9                   	leaveq 
   4247c:	c3                   	retq   

000000000004247d <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   4247d:	55                   	push   %rbp
   4247e:	48 89 e5             	mov    %rsp,%rbp
   42481:	48 83 ec 60          	sub    $0x60,%rsp
   42485:	89 7d ac             	mov    %edi,-0x54(%rbp)
   42488:	89 75 a8             	mov    %esi,-0x58(%rbp)
   4248b:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   4248f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42493:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42497:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4249b:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   424a2:	48 8d 45 10          	lea    0x10(%rbp),%rax
   424a6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   424aa:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   424ae:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   424b2:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   424b6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   424ba:	8b 75 a8             	mov    -0x58(%rbp),%esi
   424bd:	8b 45 ac             	mov    -0x54(%rbp),%eax
   424c0:	89 c7                	mov    %eax,%edi
   424c2:	e8 58 ff ff ff       	callq  4241f <error_vprintf>
   424c7:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   424ca:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   424cd:	c9                   	leaveq 
   424ce:	c3                   	retq   

00000000000424cf <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   424cf:	55                   	push   %rbp
   424d0:	48 89 e5             	mov    %rsp,%rbp
   424d3:	53                   	push   %rbx
   424d4:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   424d8:	e8 ac fb ff ff       	callq  42089 <keyboard_readc>
   424dd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   424e0:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   424e4:	74 1c                	je     42502 <check_keyboard+0x33>
   424e6:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   424ea:	74 16                	je     42502 <check_keyboard+0x33>
   424ec:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   424f0:	74 10                	je     42502 <check_keyboard+0x33>
   424f2:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   424f6:	74 0a                	je     42502 <check_keyboard+0x33>
   424f8:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   424fc:	0f 85 e9 00 00 00    	jne    425eb <check_keyboard+0x11c>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   42502:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   42509:	00 
        memset(pt, 0, PAGESIZE * 3);
   4250a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4250e:	ba 00 30 00 00       	mov    $0x3000,%edx
   42513:	be 00 00 00 00       	mov    $0x0,%esi
   42518:	48 89 c7             	mov    %rax,%rdi
   4251b:	e8 23 0d 00 00       	callq  43243 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42520:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42524:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   4252b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4252f:	48 05 00 10 00 00    	add    $0x1000,%rax
   42535:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   4253c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42540:	48 05 00 20 00 00    	add    $0x2000,%rax
   42546:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   4254d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42551:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42555:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42559:	0f 22 d8             	mov    %rax,%cr3
}
   4255c:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   4255d:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   42564:	48 c7 45 e8 f8 40 04 	movq   $0x440f8,-0x18(%rbp)
   4256b:	00 
        if (c == 'a') {
   4256c:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42570:	75 0a                	jne    4257c <check_keyboard+0xad>
            argument = "allocator";
   42572:	48 c7 45 e8 fd 40 04 	movq   $0x440fd,-0x18(%rbp)
   42579:	00 
   4257a:	eb 2e                	jmp    425aa <check_keyboard+0xdb>
        } else if (c == 'e') {
   4257c:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42580:	75 0a                	jne    4258c <check_keyboard+0xbd>
            argument = "forkexit";
   42582:	48 c7 45 e8 07 41 04 	movq   $0x44107,-0x18(%rbp)
   42589:	00 
   4258a:	eb 1e                	jmp    425aa <check_keyboard+0xdb>
        }
        else if (c == 't'){
   4258c:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42590:	75 0a                	jne    4259c <check_keyboard+0xcd>
            argument = "test";
   42592:	48 c7 45 e8 10 41 04 	movq   $0x44110,-0x18(%rbp)
   42599:	00 
   4259a:	eb 0e                	jmp    425aa <check_keyboard+0xdb>
        }
        else if(c == '2'){
   4259c:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   425a0:	75 08                	jne    425aa <check_keyboard+0xdb>
            argument = "test2";
   425a2:	48 c7 45 e8 15 41 04 	movq   $0x44115,-0x18(%rbp)
   425a9:	00 
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   425aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   425ae:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   425b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   425b7:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   425bb:	76 14                	jbe    425d1 <check_keyboard+0x102>
   425bd:	ba 1b 41 04 00       	mov    $0x4411b,%edx
   425c2:	be 5c 02 00 00       	mov    $0x25c,%esi
   425c7:	bf 37 41 04 00       	mov    $0x44137,%edi
   425cc:	e8 1f 01 00 00       	callq  426f0 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   425d1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   425d5:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   425d8:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   425dc:	48 89 c3             	mov    %rax,%rbx
   425df:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   425e4:	e9 17 da ff ff       	jmpq   40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   425e9:	eb 11                	jmp    425fc <check_keyboard+0x12d>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   425eb:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   425ef:	74 06                	je     425f7 <check_keyboard+0x128>
   425f1:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   425f5:	75 05                	jne    425fc <check_keyboard+0x12d>
        poweroff();
   425f7:	e8 ae f8 ff ff       	callq  41eaa <poweroff>
    }
    return c;
   425fc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   425ff:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42603:	c9                   	leaveq 
   42604:	c3                   	retq   

0000000000042605 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42605:	55                   	push   %rbp
   42606:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   42609:	e8 c1 fe ff ff       	callq  424cf <check_keyboard>
   4260e:	eb f9                	jmp    42609 <fail+0x4>

0000000000042610 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42610:	55                   	push   %rbp
   42611:	48 89 e5             	mov    %rsp,%rbp
   42614:	48 83 ec 60          	sub    $0x60,%rsp
   42618:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   4261c:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42620:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42624:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42628:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4262c:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42630:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   42637:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4263b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   4263f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42643:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   42647:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   4264c:	0f 84 80 00 00 00    	je     426d2 <panic+0xc2>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   42652:	ba 44 41 04 00       	mov    $0x44144,%edx
   42657:	be 00 c0 00 00       	mov    $0xc000,%esi
   4265c:	bf 30 07 00 00       	mov    $0x730,%edi
   42661:	b8 00 00 00 00       	mov    $0x0,%eax
   42666:	e8 12 fe ff ff       	callq  4247d <error_printf>
   4266b:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   4266e:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   42672:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   42676:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42679:	be 00 c0 00 00       	mov    $0xc000,%esi
   4267e:	89 c7                	mov    %eax,%edi
   42680:	e8 9a fd ff ff       	callq  4241f <error_vprintf>
   42685:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   42688:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   4268b:	48 63 c1             	movslq %ecx,%rax
   4268e:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   42695:	48 c1 e8 20          	shr    $0x20,%rax
   42699:	c1 f8 05             	sar    $0x5,%eax
   4269c:	89 ce                	mov    %ecx,%esi
   4269e:	c1 fe 1f             	sar    $0x1f,%esi
   426a1:	29 f0                	sub    %esi,%eax
   426a3:	89 c2                	mov    %eax,%edx
   426a5:	89 d0                	mov    %edx,%eax
   426a7:	c1 e0 02             	shl    $0x2,%eax
   426aa:	01 d0                	add    %edx,%eax
   426ac:	c1 e0 04             	shl    $0x4,%eax
   426af:	29 c1                	sub    %eax,%ecx
   426b1:	89 ca                	mov    %ecx,%edx
   426b3:	85 d2                	test   %edx,%edx
   426b5:	74 34                	je     426eb <panic+0xdb>
            error_printf(cpos, 0xC000, "\n");
   426b7:	8b 45 cc             	mov    -0x34(%rbp),%eax
   426ba:	ba 4c 41 04 00       	mov    $0x4414c,%edx
   426bf:	be 00 c0 00 00       	mov    $0xc000,%esi
   426c4:	89 c7                	mov    %eax,%edi
   426c6:	b8 00 00 00 00       	mov    $0x0,%eax
   426cb:	e8 ad fd ff ff       	callq  4247d <error_printf>
   426d0:	eb 19                	jmp    426eb <panic+0xdb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   426d2:	ba 4e 41 04 00       	mov    $0x4414e,%edx
   426d7:	be 00 c0 00 00       	mov    $0xc000,%esi
   426dc:	bf 30 07 00 00       	mov    $0x730,%edi
   426e1:	b8 00 00 00 00       	mov    $0x0,%eax
   426e6:	e8 92 fd ff ff       	callq  4247d <error_printf>
    }

    va_end(val);
    fail();
   426eb:	e8 15 ff ff ff       	callq  42605 <fail>

00000000000426f0 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   426f0:	55                   	push   %rbp
   426f1:	48 89 e5             	mov    %rsp,%rbp
   426f4:	48 83 ec 20          	sub    $0x20,%rsp
   426f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   426fc:	89 75 f4             	mov    %esi,-0xc(%rbp)
   426ff:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42703:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   42707:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4270a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4270e:	48 89 c6             	mov    %rax,%rsi
   42711:	bf 54 41 04 00       	mov    $0x44154,%edi
   42716:	b8 00 00 00 00       	mov    $0x0,%eax
   4271b:	e8 f0 fe ff ff       	callq  42610 <panic>

0000000000042720 <default_exception>:
}

void default_exception(proc* p){
   42720:	55                   	push   %rbp
   42721:	48 89 e5             	mov    %rsp,%rbp
   42724:	48 83 ec 20          	sub    $0x20,%rsp
   42728:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   4272c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42730:	48 83 c0 08          	add    $0x8,%rax
   42734:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   42738:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4273c:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   42743:	48 89 c6             	mov    %rax,%rsi
   42746:	bf 72 41 04 00       	mov    $0x44172,%edi
   4274b:	b8 00 00 00 00       	mov    $0x0,%eax
   42750:	e8 bb fe ff ff       	callq  42610 <panic>

0000000000042755 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   42755:	55                   	push   %rbp
   42756:	48 89 e5             	mov    %rsp,%rbp
   42759:	48 83 ec 10          	sub    $0x10,%rsp
   4275d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42761:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   42764:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42768:	78 06                	js     42770 <pageindex+0x1b>
   4276a:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   4276e:	7e 14                	jle    42784 <pageindex+0x2f>
   42770:	ba 90 41 04 00       	mov    $0x44190,%edx
   42775:	be 1e 00 00 00       	mov    $0x1e,%esi
   4277a:	bf a9 41 04 00       	mov    $0x441a9,%edi
   4277f:	e8 6c ff ff ff       	callq  426f0 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   42784:	b8 03 00 00 00       	mov    $0x3,%eax
   42789:	2b 45 f4             	sub    -0xc(%rbp),%eax
   4278c:	89 c2                	mov    %eax,%edx
   4278e:	89 d0                	mov    %edx,%eax
   42790:	c1 e0 03             	shl    $0x3,%eax
   42793:	01 d0                	add    %edx,%eax
   42795:	83 c0 0c             	add    $0xc,%eax
   42798:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4279c:	89 c1                	mov    %eax,%ecx
   4279e:	48 d3 ea             	shr    %cl,%rdx
   427a1:	48 89 d0             	mov    %rdx,%rax
   427a4:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   427a9:	c9                   	leaveq 
   427aa:	c3                   	retq   

00000000000427ab <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;


void virtual_memory_init(void) {
   427ab:	55                   	push   %rbp
   427ac:	48 89 e5             	mov    %rsp,%rbp
   427af:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   427b3:	48 c7 05 42 e8 00 00 	movq   $0x52000,0xe842(%rip)        # 51000 <kernel_pagetable>
   427ba:	00 20 05 00 
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   427be:	ba 00 50 00 00       	mov    $0x5000,%edx
   427c3:	be 00 00 00 00       	mov    $0x0,%esi
   427c8:	bf 00 20 05 00       	mov    $0x52000,%edi
   427cd:	e8 71 0a 00 00       	callq  43243 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   427d2:	b8 00 30 05 00       	mov    $0x53000,%eax
   427d7:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   427db:	48 89 05 1e f8 00 00 	mov    %rax,0xf81e(%rip)        # 52000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   427e2:	b8 00 40 05 00       	mov    $0x54000,%eax
   427e7:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   427eb:	48 89 05 0e 08 01 00 	mov    %rax,0x1080e(%rip)        # 53000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   427f2:	b8 00 50 05 00       	mov    $0x55000,%eax
   427f7:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   427fb:	48 89 05 fe 17 01 00 	mov    %rax,0x117fe(%rip)        # 54000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   42802:	b8 00 60 05 00       	mov    $0x56000,%eax
   42807:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   4280b:	48 89 05 f6 17 01 00 	mov    %rax,0x117f6(%rip)        # 54008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   42812:	48 8b 05 e7 e7 00 00 	mov    0xe7e7(%rip),%rax        # 51000 <kernel_pagetable>
   42819:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4281f:	b9 00 00 20 00       	mov    $0x200000,%ecx
   42824:	ba 00 00 00 00       	mov    $0x0,%edx
   42829:	be 00 00 00 00       	mov    $0x0,%esi
   4282e:	48 89 c7             	mov    %rax,%rdi
   42831:	e8 b9 01 00 00       	callq  429ef <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   42836:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4283d:	00 
   4283e:	eb 62                	jmp    428a2 <virtual_memory_init+0xf7>
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   42840:	48 8b 0d b9 e7 00 00 	mov    0xe7b9(%rip),%rcx        # 51000 <kernel_pagetable>
   42847:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   4284b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4284f:	48 89 ce             	mov    %rcx,%rsi
   42852:	48 89 c7             	mov    %rax,%rdi
   42855:	e8 50 05 00 00       	callq  42daa <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l4pagetable ?
        assert(vmap.pa == addr);
   4285a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4285e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   42862:	74 14                	je     42878 <virtual_memory_init+0xcd>
   42864:	ba b2 41 04 00       	mov    $0x441b2,%edx
   42869:	be 2d 00 00 00       	mov    $0x2d,%esi
   4286e:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42873:	e8 78 fe ff ff       	callq  426f0 <assert_fail>
        assert((vmap.perm & (PTE_P|PTE_W)) == (PTE_P|PTE_W));
   42878:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4287b:	48 98                	cltq   
   4287d:	83 e0 03             	and    $0x3,%eax
   42880:	48 83 f8 03          	cmp    $0x3,%rax
   42884:	74 14                	je     4289a <virtual_memory_init+0xef>
   42886:	ba c8 41 04 00       	mov    $0x441c8,%edx
   4288b:	be 2e 00 00 00       	mov    $0x2e,%esi
   42890:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42895:	e8 56 fe ff ff       	callq  426f0 <assert_fail>
    for(uintptr_t addr = 0 ; addr < MEMSIZE_PHYSICAL ; addr += PAGESIZE){
   4289a:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   428a1:	00 
   428a2:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   428a9:	00 
   428aa:	76 94                	jbe    42840 <virtual_memory_init+0x95>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   428ac:	48 8b 05 4d e7 00 00 	mov    0xe74d(%rip),%rax        # 51000 <kernel_pagetable>
   428b3:	48 89 c7             	mov    %rax,%rdi
   428b6:	e8 03 00 00 00       	callq  428be <set_pagetable>
}
   428bb:	90                   	nop
   428bc:	c9                   	leaveq 
   428bd:	c3                   	retq   

00000000000428be <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   428be:	55                   	push   %rbp
   428bf:	48 89 e5             	mov    %rsp,%rbp
   428c2:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   428c6:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   428ca:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   428ce:	25 ff 0f 00 00       	and    $0xfff,%eax
   428d3:	48 85 c0             	test   %rax,%rax
   428d6:	74 14                	je     428ec <set_pagetable+0x2e>
   428d8:	ba f5 41 04 00       	mov    $0x441f5,%edx
   428dd:	be 3d 00 00 00       	mov    $0x3d,%esi
   428e2:	bf c2 41 04 00       	mov    $0x441c2,%edi
   428e7:	e8 04 fe ff ff       	callq  426f0 <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   428ec:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   428f1:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   428f5:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   428f9:	48 89 ce             	mov    %rcx,%rsi
   428fc:	48 89 c7             	mov    %rax,%rdi
   428ff:	e8 a6 04 00 00       	callq  42daa <virtual_memory_lookup>
   42904:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   42908:	ba 9c 00 04 00       	mov    $0x4009c,%edx
   4290d:	48 39 d0             	cmp    %rdx,%rax
   42910:	74 14                	je     42926 <set_pagetable+0x68>
   42912:	ba 10 42 04 00       	mov    $0x44210,%edx
   42917:	be 3f 00 00 00       	mov    $0x3f,%esi
   4291c:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42921:	e8 ca fd ff ff       	callq  426f0 <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   42926:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   4292a:	48 8b 0d cf e6 00 00 	mov    0xe6cf(%rip),%rcx        # 51000 <kernel_pagetable>
   42931:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   42935:	48 89 ce             	mov    %rcx,%rsi
   42938:	48 89 c7             	mov    %rax,%rdi
   4293b:	e8 6a 04 00 00       	callq  42daa <virtual_memory_lookup>
   42940:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42944:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42948:	48 39 c2             	cmp    %rax,%rdx
   4294b:	74 14                	je     42961 <set_pagetable+0xa3>
   4294d:	ba 78 42 04 00       	mov    $0x44278,%edx
   42952:	be 41 00 00 00       	mov    $0x41,%esi
   42957:	bf c2 41 04 00       	mov    $0x441c2,%edi
   4295c:	e8 8f fd ff ff       	callq  426f0 <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   42961:	48 8b 05 98 e6 00 00 	mov    0xe698(%rip),%rax        # 51000 <kernel_pagetable>
   42968:	48 89 c2             	mov    %rax,%rdx
   4296b:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   4296f:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42973:	48 89 ce             	mov    %rcx,%rsi
   42976:	48 89 c7             	mov    %rax,%rdi
   42979:	e8 2c 04 00 00       	callq  42daa <virtual_memory_lookup>
   4297e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42982:	48 8b 15 77 e6 00 00 	mov    0xe677(%rip),%rdx        # 51000 <kernel_pagetable>
   42989:	48 39 d0             	cmp    %rdx,%rax
   4298c:	74 14                	je     429a2 <set_pagetable+0xe4>
   4298e:	ba d8 42 04 00       	mov    $0x442d8,%edx
   42993:	be 43 00 00 00       	mov    $0x43,%esi
   42998:	bf c2 41 04 00       	mov    $0x441c2,%edi
   4299d:	e8 4e fd ff ff       	callq  426f0 <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   429a2:	ba ef 29 04 00       	mov    $0x429ef,%edx
   429a7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   429ab:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   429af:	48 89 ce             	mov    %rcx,%rsi
   429b2:	48 89 c7             	mov    %rax,%rdi
   429b5:	e8 f0 03 00 00       	callq  42daa <virtual_memory_lookup>
   429ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   429be:	ba ef 29 04 00       	mov    $0x429ef,%edx
   429c3:	48 39 d0             	cmp    %rdx,%rax
   429c6:	74 14                	je     429dc <set_pagetable+0x11e>
   429c8:	ba 40 43 04 00       	mov    $0x44340,%edx
   429cd:	be 45 00 00 00       	mov    $0x45,%esi
   429d2:	bf c2 41 04 00       	mov    $0x441c2,%edi
   429d7:	e8 14 fd ff ff       	callq  426f0 <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   429dc:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   429e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   429e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   429e8:	0f 22 d8             	mov    %rax,%cr3
}
   429eb:	90                   	nop
}
   429ec:	90                   	nop
   429ed:	c9                   	leaveq 
   429ee:	c3                   	retq   

00000000000429ef <virtual_memory_map>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va, uintptr_t pa, size_t sz, int perm) {
   429ef:	55                   	push   %rbp
   429f0:	48 89 e5             	mov    %rsp,%rbp
   429f3:	53                   	push   %rbx
   429f4:	48 83 ec 58          	sub    $0x58,%rsp
   429f8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   429fc:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42a00:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42a04:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42a08:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
     // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   42a0c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42a10:	25 ff 0f 00 00       	and    $0xfff,%eax
   42a15:	48 85 c0             	test   %rax,%rax
   42a18:	74 14                	je     42a2e <virtual_memory_map+0x3f>
   42a1a:	ba a6 43 04 00       	mov    $0x443a6,%edx
   42a1f:	be 63 00 00 00       	mov    $0x63,%esi
   42a24:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42a29:	e8 c2 fc ff ff       	callq  426f0 <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   42a2e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42a32:	25 ff 0f 00 00       	and    $0xfff,%eax
   42a37:	48 85 c0             	test   %rax,%rax
   42a3a:	74 14                	je     42a50 <virtual_memory_map+0x61>
   42a3c:	ba b9 43 04 00       	mov    $0x443b9,%edx
   42a41:	be 64 00 00 00       	mov    $0x64,%esi
   42a46:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42a4b:	e8 a0 fc ff ff       	callq  426f0 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   42a50:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42a54:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42a58:	48 01 d0             	add    %rdx,%rax
   42a5b:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   42a5f:	76 24                	jbe    42a85 <virtual_memory_map+0x96>
   42a61:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42a65:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42a69:	48 01 d0             	add    %rdx,%rax
   42a6c:	48 85 c0             	test   %rax,%rax
   42a6f:	74 14                	je     42a85 <virtual_memory_map+0x96>
   42a71:	ba cc 43 04 00       	mov    $0x443cc,%edx
   42a76:	be 65 00 00 00       	mov    $0x65,%esi
   42a7b:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42a80:	e8 6b fc ff ff       	callq  426f0 <assert_fail>
    if (perm & PTE_P) {
   42a85:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42a88:	48 98                	cltq   
   42a8a:	83 e0 01             	and    $0x1,%eax
   42a8d:	48 85 c0             	test   %rax,%rax
   42a90:	74 6e                	je     42b00 <virtual_memory_map+0x111>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   42a92:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42a96:	25 ff 0f 00 00       	and    $0xfff,%eax
   42a9b:	48 85 c0             	test   %rax,%rax
   42a9e:	74 14                	je     42ab4 <virtual_memory_map+0xc5>
   42aa0:	ba ea 43 04 00       	mov    $0x443ea,%edx
   42aa5:	be 67 00 00 00       	mov    $0x67,%esi
   42aaa:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42aaf:	e8 3c fc ff ff       	callq  426f0 <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   42ab4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42ab8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42abc:	48 01 d0             	add    %rdx,%rax
   42abf:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   42ac3:	76 14                	jbe    42ad9 <virtual_memory_map+0xea>
   42ac5:	ba fd 43 04 00       	mov    $0x443fd,%edx
   42aca:	be 68 00 00 00       	mov    $0x68,%esi
   42acf:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42ad4:	e8 17 fc ff ff       	callq  426f0 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   42ad9:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42add:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42ae1:	48 01 d0             	add    %rdx,%rax
   42ae4:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   42aea:	76 14                	jbe    42b00 <virtual_memory_map+0x111>
   42aec:	ba 0b 44 04 00       	mov    $0x4440b,%edx
   42af1:	be 69 00 00 00       	mov    $0x69,%esi
   42af6:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42afb:	e8 f0 fb ff ff       	callq  426f0 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense (perm can only be 12 bits)
   42b00:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   42b04:	78 09                	js     42b0f <virtual_memory_map+0x120>
   42b06:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   42b0d:	7e 14                	jle    42b23 <virtual_memory_map+0x134>
   42b0f:	ba 27 44 04 00       	mov    $0x44427,%edx
   42b14:	be 6b 00 00 00       	mov    $0x6b,%esi
   42b19:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42b1e:	e8 cd fb ff ff       	callq  426f0 <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   42b23:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42b27:	25 ff 0f 00 00       	and    $0xfff,%eax
   42b2c:	48 85 c0             	test   %rax,%rax
   42b2f:	74 14                	je     42b45 <virtual_memory_map+0x156>
   42b31:	ba 48 44 04 00       	mov    $0x44448,%edx
   42b36:	be 6c 00 00 00       	mov    $0x6c,%esi
   42b3b:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42b40:	e8 ab fb ff ff       	callq  426f0 <assert_fail>

    int last_index123 = -1;
   42b45:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l4pagetable = NULL;
   42b4c:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   42b53:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   42b54:	e9 e1 00 00 00       	jmpq   42c3a <virtual_memory_map+0x24b>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   42b59:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42b5d:	48 c1 e8 15          	shr    $0x15,%rax
   42b61:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   42b64:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42b67:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   42b6a:	74 20                	je     42b8c <virtual_memory_map+0x19d>
            // TODO
            // find pointer to last level pagetable for current va
            l4pagetable = lookup_l4pagetable(pagetable, va, perm);
   42b6c:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42b6f:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   42b73:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42b77:	48 89 ce             	mov    %rcx,%rsi
   42b7a:	48 89 c7             	mov    %rax,%rdi
   42b7d:	e8 ce 00 00 00       	callq  42c50 <lookup_l4pagetable>
   42b82:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   42b86:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42b89:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l4pagetable) { // if page is marked present
   42b8c:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42b8f:	48 98                	cltq   
   42b91:	83 e0 01             	and    $0x1,%eax
   42b94:	48 85 c0             	test   %rax,%rax
   42b97:	74 34                	je     42bcd <virtual_memory_map+0x1de>
   42b99:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42b9e:	74 2d                	je     42bcd <virtual_memory_map+0x1de>
            // TODO
            l4pagetable->entry[L4PAGEINDEX(va)] = pa | perm;
   42ba0:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42ba3:	48 63 d8             	movslq %eax,%rbx
   42ba6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42baa:	be 03 00 00 00       	mov    $0x3,%esi
   42baf:	48 89 c7             	mov    %rax,%rdi
   42bb2:	e8 9e fb ff ff       	callq  42755 <pageindex>
   42bb7:	89 c2                	mov    %eax,%edx
   42bb9:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   42bbd:	48 89 d9             	mov    %rbx,%rcx
   42bc0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42bc4:	48 63 d2             	movslq %edx,%rdx
   42bc7:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42bcb:	eb 55                	jmp    42c22 <virtual_memory_map+0x233>
            // map `pa` at appropriate entry with permissions `perm`
        } else if (l4pagetable) { // if page is NOT marked present
   42bcd:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42bd2:	74 26                	je     42bfa <virtual_memory_map+0x20b>
            // TODO
            // map to address 0 with `perm`
            l4pagetable->entry[L4PAGEINDEX(va)] = perm;
   42bd4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42bd8:	be 03 00 00 00       	mov    $0x3,%esi
   42bdd:	48 89 c7             	mov    %rax,%rdi
   42be0:	e8 70 fb ff ff       	callq  42755 <pageindex>
   42be5:	89 c2                	mov    %eax,%edx
   42be7:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42bea:	48 63 c8             	movslq %eax,%rcx
   42bed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42bf1:	48 63 d2             	movslq %edx,%rdx
   42bf4:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42bf8:	eb 28                	jmp    42c22 <virtual_memory_map+0x233>
        } else if (perm & PTE_P) {
   42bfa:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42bfd:	48 98                	cltq   
   42bff:	83 e0 01             	and    $0x1,%eax
   42c02:	48 85 c0             	test   %rax,%rax
   42c05:	74 1b                	je     42c22 <virtual_memory_map+0x233>
            // error, no allocated l4 page found for va
            log_printf("[Kern Info] failed to find l4pagetable address at " __FILE__ ": %d\n", __LINE__);
   42c07:	be 84 00 00 00       	mov    $0x84,%esi
   42c0c:	bf 70 44 04 00       	mov    $0x44470,%edi
   42c11:	b8 00 00 00 00       	mov    $0x0,%eax
   42c16:	e8 b7 f7 ff ff       	callq  423d2 <log_printf>
            return -1;
   42c1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42c20:	eb 28                	jmp    42c4a <virtual_memory_map+0x25b>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   42c22:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   42c29:	00 
   42c2a:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   42c31:	00 
   42c32:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   42c39:	00 
   42c3a:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   42c3f:	0f 85 14 ff ff ff    	jne    42b59 <virtual_memory_map+0x16a>
        }
    }
    return 0;
   42c45:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42c4a:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42c4e:	c9                   	leaveq 
   42c4f:	c3                   	retq   

0000000000042c50 <lookup_l4pagetable>:
//    Helper function to find the last level of `va` in `pagetable`
//
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable, uintptr_t va, int perm) {
   42c50:	55                   	push   %rbp
   42c51:	48 89 e5             	mov    %rsp,%rbp
   42c54:	48 83 ec 40          	sub    $0x40,%rsp
   42c58:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   42c5c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   42c60:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable* pt = pagetable;
   42c63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42c67:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l4 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i) {
   42c6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42c72:	e9 23 01 00 00       	jmpq   42d9a <lookup_l4pagetable+0x14a>
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)];
   42c77:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42c7a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42c7e:	89 d6                	mov    %edx,%esi
   42c80:	48 89 c7             	mov    %rax,%rdi
   42c83:	e8 cd fa ff ff       	callq  42755 <pageindex>
   42c88:	89 c2                	mov    %eax,%edx
   42c8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42c8e:	48 63 d2             	movslq %edx,%rdx
   42c91:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   42c95:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P)) { // address of next level should be present AND PTE_P should be set, error otherwise
   42c99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42c9d:	83 e0 01             	and    $0x1,%eax
   42ca0:	48 85 c0             	test   %rax,%rax
   42ca3:	75 63                	jne    42d08 <lookup_l4pagetable+0xb8>
            log_printf("[Kern Info] Error looking up l4pagetable: Pagetable address: 0x%x perm: 0x%x."
   42ca5:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42ca8:	8d 48 02             	lea    0x2(%rax),%ecx
   42cab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42caf:	25 ff 0f 00 00       	and    $0xfff,%eax
   42cb4:	48 89 c2             	mov    %rax,%rdx
   42cb7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42cbb:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42cc1:	48 89 c6             	mov    %rax,%rsi
   42cc4:	bf b0 44 04 00       	mov    $0x444b0,%edi
   42cc9:	b8 00 00 00 00       	mov    $0x0,%eax
   42cce:	e8 ff f6 ff ff       	callq  423d2 <log_printf>
                    " Failed to get level (%d)\n",
                    PTE_ADDR(pe), PTE_FLAGS(pe), (i+2));
            if (!(perm & PTE_P)) {
   42cd3:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42cd6:	48 98                	cltq   
   42cd8:	83 e0 01             	and    $0x1,%eax
   42cdb:	48 85 c0             	test   %rax,%rax
   42cde:	75 0a                	jne    42cea <lookup_l4pagetable+0x9a>
                return NULL;
   42ce0:	b8 00 00 00 00       	mov    $0x0,%eax
   42ce5:	e9 be 00 00 00       	jmpq   42da8 <lookup_l4pagetable+0x158>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   42cea:	be a7 00 00 00       	mov    $0xa7,%esi
   42cef:	bf 18 45 04 00       	mov    $0x44518,%edi
   42cf4:	b8 00 00 00 00       	mov    $0x0,%eax
   42cf9:	e8 d4 f6 ff ff       	callq  423d2 <log_printf>
            return NULL;
   42cfe:	b8 00 00 00 00       	mov    $0x0,%eax
   42d03:	e9 a0 00 00 00       	jmpq   42da8 <lookup_l4pagetable+0x158>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   42d08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d0c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42d12:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   42d18:	76 14                	jbe    42d2e <lookup_l4pagetable+0xde>
   42d1a:	ba 58 45 04 00       	mov    $0x44558,%edx
   42d1f:	be ac 00 00 00       	mov    $0xac,%esi
   42d24:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42d29:	e8 c2 f9 ff ff       	callq  426f0 <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   42d2e:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42d31:	48 98                	cltq   
   42d33:	83 e0 02             	and    $0x2,%eax
   42d36:	48 85 c0             	test   %rax,%rax
   42d39:	74 20                	je     42d5b <lookup_l4pagetable+0x10b>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   42d3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d3f:	83 e0 02             	and    $0x2,%eax
   42d42:	48 85 c0             	test   %rax,%rax
   42d45:	75 14                	jne    42d5b <lookup_l4pagetable+0x10b>
   42d47:	ba 78 45 04 00       	mov    $0x44578,%edx
   42d4c:	be ae 00 00 00       	mov    $0xae,%esi
   42d51:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42d56:	e8 95 f9 ff ff       	callq  426f0 <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   42d5b:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42d5e:	48 98                	cltq   
   42d60:	83 e0 04             	and    $0x4,%eax
   42d63:	48 85 c0             	test   %rax,%rax
   42d66:	74 20                	je     42d88 <lookup_l4pagetable+0x138>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   42d68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d6c:	83 e0 04             	and    $0x4,%eax
   42d6f:	48 85 c0             	test   %rax,%rax
   42d72:	75 14                	jne    42d88 <lookup_l4pagetable+0x138>
   42d74:	ba 83 45 04 00       	mov    $0x44583,%edx
   42d79:	be b1 00 00 00       	mov    $0xb1,%esi
   42d7e:	bf c2 41 04 00       	mov    $0x441c2,%edi
   42d83:	e8 68 f9 ff ff       	callq  426f0 <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *) PTE_ADDR(pe); // replace this
   42d88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d8c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42d92:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   42d96:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42d9a:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   42d9e:	0f 8e d3 fe ff ff    	jle    42c77 <lookup_l4pagetable+0x27>
    }
    return pt;
   42da4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   42da8:	c9                   	leaveq 
   42da9:	c3                   	retq   

0000000000042daa <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   42daa:	55                   	push   %rbp
   42dab:	48 89 e5             	mov    %rsp,%rbp
   42dae:	48 83 ec 50          	sub    $0x50,%rsp
   42db2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42db6:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42dba:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   42dbe:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42dc2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   42dc6:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   42dcd:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   42dce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   42dd5:	eb 41                	jmp    42e18 <virtual_memory_lookup+0x6e>
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   42dd7:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42dda:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42dde:	89 d6                	mov    %edx,%esi
   42de0:	48 89 c7             	mov    %rax,%rdi
   42de3:	e8 6d f9 ff ff       	callq  42755 <pageindex>
   42de8:	89 c2                	mov    %eax,%edx
   42dea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42dee:	48 63 d2             	movslq %edx,%rdx
   42df1:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   42df5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42df9:	83 e0 06             	and    $0x6,%eax
   42dfc:	48 f7 d0             	not    %rax
   42dff:	48 21 d0             	and    %rdx,%rax
   42e02:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   42e06:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42e0a:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42e10:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i) {
   42e14:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   42e18:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   42e1c:	7f 0c                	jg     42e2a <virtual_memory_lookup+0x80>
   42e1e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42e22:	83 e0 01             	and    $0x1,%eax
   42e25:	48 85 c0             	test   %rax,%rax
   42e28:	75 ad                	jne    42dd7 <virtual_memory_lookup+0x2d>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   42e2a:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   42e31:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   42e38:	ff 
   42e39:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P) {
   42e40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42e44:	83 e0 01             	and    $0x1,%eax
   42e47:	48 85 c0             	test   %rax,%rax
   42e4a:	74 34                	je     42e80 <virtual_memory_lookup+0xd6>
        vam.pn = PAGENUMBER(pe);
   42e4c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42e50:	48 c1 e8 0c          	shr    $0xc,%rax
   42e54:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   42e57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42e5b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42e61:	48 89 c2             	mov    %rax,%rdx
   42e64:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42e68:	25 ff 0f 00 00       	and    $0xfff,%eax
   42e6d:	48 09 d0             	or     %rdx,%rax
   42e70:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   42e74:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42e78:	25 ff 0f 00 00       	and    $0xfff,%eax
   42e7d:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   42e80:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42e84:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   42e88:	48 89 10             	mov    %rdx,(%rax)
   42e8b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   42e8f:	48 89 50 08          	mov    %rdx,0x8(%rax)
   42e93:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   42e97:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   42e9b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42e9f:	c9                   	leaveq 
   42ea0:	c3                   	retq   

0000000000042ea1 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   42ea1:	55                   	push   %rbp
   42ea2:	48 89 e5             	mov    %rsp,%rbp
   42ea5:	48 83 ec 40          	sub    $0x40,%rsp
   42ea9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   42ead:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   42eb0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   42eb4:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   42ebb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   42ebf:	78 08                	js     42ec9 <program_load+0x28>
   42ec1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   42ec4:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   42ec7:	7c 14                	jl     42edd <program_load+0x3c>
   42ec9:	ba 90 45 04 00       	mov    $0x44590,%edx
   42ece:	be 37 00 00 00       	mov    $0x37,%esi
   42ed3:	bf c0 45 04 00       	mov    $0x445c0,%edi
   42ed8:	e8 13 f8 ff ff       	callq  426f0 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   42edd:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   42ee0:	48 98                	cltq   
   42ee2:	48 c1 e0 04          	shl    $0x4,%rax
   42ee6:	48 05 20 50 04 00    	add    $0x45020,%rax
   42eec:	48 8b 00             	mov    (%rax),%rax
   42eef:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   42ef3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42ef7:	8b 00                	mov    (%rax),%eax
   42ef9:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   42efe:	74 14                	je     42f14 <program_load+0x73>
   42f00:	ba cb 45 04 00       	mov    $0x445cb,%edx
   42f05:	be 39 00 00 00       	mov    $0x39,%esi
   42f0a:	bf c0 45 04 00       	mov    $0x445c0,%edi
   42f0f:	e8 dc f7 ff ff       	callq  426f0 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   42f14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f18:	48 8b 50 20          	mov    0x20(%rax),%rdx
   42f1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f20:	48 01 d0             	add    %rdx,%rax
   42f23:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   42f27:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42f2e:	e9 94 00 00 00       	jmpq   42fc7 <program_load+0x126>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   42f33:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42f36:	48 63 d0             	movslq %eax,%rdx
   42f39:	48 89 d0             	mov    %rdx,%rax
   42f3c:	48 c1 e0 03          	shl    $0x3,%rax
   42f40:	48 29 d0             	sub    %rdx,%rax
   42f43:	48 c1 e0 03          	shl    $0x3,%rax
   42f47:	48 89 c2             	mov    %rax,%rdx
   42f4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42f4e:	48 01 d0             	add    %rdx,%rax
   42f51:	8b 00                	mov    (%rax),%eax
   42f53:	83 f8 01             	cmp    $0x1,%eax
   42f56:	75 6b                	jne    42fc3 <program_load+0x122>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   42f58:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42f5b:	48 63 d0             	movslq %eax,%rdx
   42f5e:	48 89 d0             	mov    %rdx,%rax
   42f61:	48 c1 e0 03          	shl    $0x3,%rax
   42f65:	48 29 d0             	sub    %rdx,%rax
   42f68:	48 c1 e0 03          	shl    $0x3,%rax
   42f6c:	48 89 c2             	mov    %rax,%rdx
   42f6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42f73:	48 01 d0             	add    %rdx,%rax
   42f76:	48 8b 50 08          	mov    0x8(%rax),%rdx
   42f7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f7e:	48 01 d0             	add    %rdx,%rax
   42f81:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   42f85:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42f88:	48 63 d0             	movslq %eax,%rdx
   42f8b:	48 89 d0             	mov    %rdx,%rax
   42f8e:	48 c1 e0 03          	shl    $0x3,%rax
   42f92:	48 29 d0             	sub    %rdx,%rax
   42f95:	48 c1 e0 03          	shl    $0x3,%rax
   42f99:	48 89 c2             	mov    %rax,%rdx
   42f9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42fa0:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   42fa4:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   42fa8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   42fac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42fb0:	48 89 c7             	mov    %rax,%rdi
   42fb3:	e8 3d 00 00 00       	callq  42ff5 <program_load_segment>
   42fb8:	85 c0                	test   %eax,%eax
   42fba:	79 07                	jns    42fc3 <program_load+0x122>
                return -1;
   42fbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42fc1:	eb 30                	jmp    42ff3 <program_load+0x152>
    for (int i = 0; i < eh->e_phnum; ++i) {
   42fc3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42fc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fcb:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   42fcf:	0f b7 c0             	movzwl %ax,%eax
   42fd2:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   42fd5:	0f 8c 58 ff ff ff    	jl     42f33 <program_load+0x92>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   42fdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fdf:	48 8b 50 18          	mov    0x18(%rax),%rdx
   42fe3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42fe7:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   42fee:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42ff3:	c9                   	leaveq 
   42ff4:	c3                   	retq   

0000000000042ff5 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   42ff5:	55                   	push   %rbp
   42ff6:	48 89 e5             	mov    %rsp,%rbp
   42ff9:	48 83 ec 40          	sub    $0x40,%rsp
   42ffd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43001:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   43005:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   43009:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   4300d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43011:	48 8b 40 10          	mov    0x10(%rax),%rax
   43015:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   43019:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4301d:	48 8b 50 20          	mov    0x20(%rax),%rdx
   43021:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43025:	48 01 d0             	add    %rdx,%rax
   43028:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   4302c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43030:	48 8b 50 28          	mov    0x28(%rax),%rdx
   43034:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43038:	48 01 d0             	add    %rdx,%rax
   4303b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   4303f:	48 81 65 f0 00 f0 ff 	andq   $0xfffffffffffff000,-0x10(%rbp)
   43046:	ff 

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43047:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4304b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   4304f:	eb 7c                	jmp    430cd <program_load_segment+0xd8>
        if (assign_physical_page(addr, p->p_pid) < 0
   43051:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43055:	8b 00                	mov    (%rax),%eax
   43057:	0f be d0             	movsbl %al,%edx
   4305a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4305e:	89 d6                	mov    %edx,%esi
   43060:	48 89 c7             	mov    %rax,%rdi
   43063:	e8 f3 d7 ff ff       	callq  4085b <assign_physical_page>
   43068:	85 c0                	test   %eax,%eax
   4306a:	78 2a                	js     43096 <program_load_segment+0xa1>
            || virtual_memory_map(p->p_pagetable, addr, addr, PAGESIZE,
   4306c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43070:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43077:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4307b:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   4307f:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   43085:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4308a:	48 89 c7             	mov    %rax,%rdi
   4308d:	e8 5d f9 ff ff       	callq  429ef <virtual_memory_map>
   43092:	85 c0                	test   %eax,%eax
   43094:	79 2f                	jns    430c5 <program_load_segment+0xd0>
                                  PTE_P | PTE_W | PTE_U) < 0) {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43096:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4309a:	8b 00                	mov    (%rax),%eax
   4309c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   430a0:	49 89 d0             	mov    %rdx,%r8
   430a3:	89 c1                	mov    %eax,%ecx
   430a5:	ba e8 45 04 00       	mov    $0x445e8,%edx
   430aa:	be 00 c0 00 00       	mov    $0xc000,%esi
   430af:	bf e0 06 00 00       	mov    $0x6e0,%edi
   430b4:	b8 00 00 00 00       	mov    $0x0,%eax
   430b9:	e8 ba 09 00 00       	callq  43a78 <console_printf>
            return -1;
   430be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   430c3:	eb 77                	jmp    4313c <program_load_segment+0x147>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   430c5:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   430cc:	00 
   430cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   430d1:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   430d5:	0f 82 76 ff ff ff    	jb     43051 <program_load_segment+0x5c>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   430db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   430df:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   430e6:	48 89 c7             	mov    %rax,%rdi
   430e9:	e8 d0 f7 ff ff       	callq  428be <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   430ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430f2:	48 2b 45 f0          	sub    -0x10(%rbp),%rax
   430f6:	48 89 c2             	mov    %rax,%rdx
   430f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   430fd:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43101:	48 89 ce             	mov    %rcx,%rsi
   43104:	48 89 c7             	mov    %rax,%rdi
   43107:	e8 ce 00 00 00       	callq  431da <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   4310c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43110:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43114:	48 89 c2             	mov    %rax,%rdx
   43117:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4311b:	be 00 00 00 00       	mov    $0x0,%esi
   43120:	48 89 c7             	mov    %rax,%rdi
   43123:	e8 1b 01 00 00       	callq  43243 <memset>

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   43128:	48 8b 05 d1 de 00 00 	mov    0xded1(%rip),%rax        # 51000 <kernel_pagetable>
   4312f:	48 89 c7             	mov    %rax,%rdi
   43132:	e8 87 f7 ff ff       	callq  428be <set_pagetable>
    return 0;
   43137:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4313c:	c9                   	leaveq 
   4313d:	c3                   	retq   

000000000004313e <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   4313e:	48 89 f9             	mov    %rdi,%rcx
   43141:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   43143:	48 81 79 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rcx)
   4314a:	00 
   4314b:	72 08                	jb     43155 <console_putc+0x17>
        cp->cursor = console;
   4314d:	48 c7 41 08 00 80 0b 	movq   $0xb8000,0x8(%rcx)
   43154:	00 
    }
    if (c == '\n') {
   43155:	40 80 fe 0a          	cmp    $0xa,%sil
   43159:	74 16                	je     43171 <console_putc+0x33>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
   4315b:	48 8b 41 08          	mov    0x8(%rcx),%rax
   4315f:	48 8d 50 02          	lea    0x2(%rax),%rdx
   43163:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   43167:	40 0f b6 f6          	movzbl %sil,%esi
   4316b:	09 fe                	or     %edi,%esi
   4316d:	66 89 30             	mov    %si,(%rax)
    }
}
   43170:	c3                   	retq   
        int pos = (cp->cursor - console) % 80;
   43171:	4c 8b 41 08          	mov    0x8(%rcx),%r8
   43175:	49 81 e8 00 80 0b 00 	sub    $0xb8000,%r8
   4317c:	4c 89 c6             	mov    %r8,%rsi
   4317f:	48 d1 fe             	sar    %rsi
   43182:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   43189:	66 66 66 
   4318c:	48 89 f0             	mov    %rsi,%rax
   4318f:	48 f7 ea             	imul   %rdx
   43192:	48 c1 fa 05          	sar    $0x5,%rdx
   43196:	49 c1 f8 3f          	sar    $0x3f,%r8
   4319a:	4c 29 c2             	sub    %r8,%rdx
   4319d:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   431a1:	48 c1 e2 04          	shl    $0x4,%rdx
   431a5:	89 f0                	mov    %esi,%eax
   431a7:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
   431a9:	83 cf 20             	or     $0x20,%edi
   431ac:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   431b0:	48 8d 72 02          	lea    0x2(%rdx),%rsi
   431b4:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   431b8:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
   431bb:	83 c0 01             	add    $0x1,%eax
   431be:	83 f8 50             	cmp    $0x50,%eax
   431c1:	75 e9                	jne    431ac <console_putc+0x6e>
   431c3:	c3                   	retq   

00000000000431c4 <string_putc>:
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
   431c4:	48 8b 47 08          	mov    0x8(%rdi),%rax
   431c8:	48 3b 47 10          	cmp    0x10(%rdi),%rax
   431cc:	73 0b                	jae    431d9 <string_putc+0x15>
        *sp->s++ = c;
   431ce:	48 8d 50 01          	lea    0x1(%rax),%rdx
   431d2:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   431d6:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
   431d9:	c3                   	retq   

00000000000431da <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
   431da:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   431dd:	48 85 d2             	test   %rdx,%rdx
   431e0:	74 17                	je     431f9 <memcpy+0x1f>
   431e2:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   431e7:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   431ec:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   431f0:	48 83 c1 01          	add    $0x1,%rcx
   431f4:	48 39 d1             	cmp    %rdx,%rcx
   431f7:	75 ee                	jne    431e7 <memcpy+0xd>
}
   431f9:	c3                   	retq   

00000000000431fa <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
   431fa:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
   431fd:	48 39 fe             	cmp    %rdi,%rsi
   43200:	72 1d                	jb     4321f <memmove+0x25>
        while (n-- > 0) {
   43202:	b9 00 00 00 00       	mov    $0x0,%ecx
   43207:	48 85 d2             	test   %rdx,%rdx
   4320a:	74 12                	je     4321e <memmove+0x24>
            *d++ = *s++;
   4320c:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   43210:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   43214:	48 83 c1 01          	add    $0x1,%rcx
   43218:	48 39 ca             	cmp    %rcx,%rdx
   4321b:	75 ef                	jne    4320c <memmove+0x12>
}
   4321d:	c3                   	retq   
   4321e:	c3                   	retq   
    if (s < d && s + n > d) {
   4321f:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   43223:	48 39 cf             	cmp    %rcx,%rdi
   43226:	73 da                	jae    43202 <memmove+0x8>
        while (n-- > 0) {
   43228:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   4322c:	48 85 d2             	test   %rdx,%rdx
   4322f:	74 ec                	je     4321d <memmove+0x23>
            *--d = *--s;
   43231:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   43235:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   43238:	48 83 e9 01          	sub    $0x1,%rcx
   4323c:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   43240:	75 ef                	jne    43231 <memmove+0x37>
   43242:	c3                   	retq   

0000000000043243 <memset>:
void* memset(void* v, int c, size_t n) {
   43243:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43246:	48 85 d2             	test   %rdx,%rdx
   43249:	74 12                	je     4325d <memset+0x1a>
   4324b:	48 01 fa             	add    %rdi,%rdx
   4324e:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   43251:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43254:	48 83 c1 01          	add    $0x1,%rcx
   43258:	48 39 ca             	cmp    %rcx,%rdx
   4325b:	75 f4                	jne    43251 <memset+0xe>
}
   4325d:	c3                   	retq   

000000000004325e <strlen>:
    for (n = 0; *s != '\0'; ++s) {
   4325e:	80 3f 00             	cmpb   $0x0,(%rdi)
   43261:	74 10                	je     43273 <strlen+0x15>
   43263:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   43268:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   4326c:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   43270:	75 f6                	jne    43268 <strlen+0xa>
   43272:	c3                   	retq   
   43273:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43278:	c3                   	retq   

0000000000043279 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
   43279:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4327c:	ba 00 00 00 00       	mov    $0x0,%edx
   43281:	48 85 f6             	test   %rsi,%rsi
   43284:	74 11                	je     43297 <strnlen+0x1e>
   43286:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   4328a:	74 0c                	je     43298 <strnlen+0x1f>
        ++n;
   4328c:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43290:	48 39 d0             	cmp    %rdx,%rax
   43293:	75 f1                	jne    43286 <strnlen+0xd>
   43295:	eb 04                	jmp    4329b <strnlen+0x22>
   43297:	c3                   	retq   
   43298:	48 89 d0             	mov    %rdx,%rax
}
   4329b:	c3                   	retq   

000000000004329c <strcpy>:
char* strcpy(char* dst, const char* src) {
   4329c:	48 89 f8             	mov    %rdi,%rax
   4329f:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
   432a4:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   432a8:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
   432ab:	48 83 c2 01          	add    $0x1,%rdx
   432af:	84 c9                	test   %cl,%cl
   432b1:	75 f1                	jne    432a4 <strcpy+0x8>
}
   432b3:	c3                   	retq   

00000000000432b4 <strcmp>:
    while (*a && *b && *a == *b) {
   432b4:	0f b6 07             	movzbl (%rdi),%eax
   432b7:	84 c0                	test   %al,%al
   432b9:	74 1a                	je     432d5 <strcmp+0x21>
   432bb:	0f b6 16             	movzbl (%rsi),%edx
   432be:	38 c2                	cmp    %al,%dl
   432c0:	75 13                	jne    432d5 <strcmp+0x21>
   432c2:	84 d2                	test   %dl,%dl
   432c4:	74 0f                	je     432d5 <strcmp+0x21>
        ++a, ++b;
   432c6:	48 83 c7 01          	add    $0x1,%rdi
   432ca:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
   432ce:	0f b6 07             	movzbl (%rdi),%eax
   432d1:	84 c0                	test   %al,%al
   432d3:	75 e6                	jne    432bb <strcmp+0x7>
    return ((unsigned char) *a > (unsigned char) *b)
   432d5:	3a 06                	cmp    (%rsi),%al
   432d7:	0f 97 c0             	seta   %al
   432da:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
   432dd:	83 d8 00             	sbb    $0x0,%eax
}
   432e0:	c3                   	retq   

00000000000432e1 <strchr>:
    while (*s && *s != (char) c) {
   432e1:	0f b6 07             	movzbl (%rdi),%eax
   432e4:	84 c0                	test   %al,%al
   432e6:	74 10                	je     432f8 <strchr+0x17>
   432e8:	40 38 f0             	cmp    %sil,%al
   432eb:	74 18                	je     43305 <strchr+0x24>
        ++s;
   432ed:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   432f1:	0f b6 07             	movzbl (%rdi),%eax
   432f4:	84 c0                	test   %al,%al
   432f6:	75 f0                	jne    432e8 <strchr+0x7>
        return NULL;
   432f8:	40 84 f6             	test   %sil,%sil
   432fb:	b8 00 00 00 00       	mov    $0x0,%eax
   43300:	48 0f 44 c7          	cmove  %rdi,%rax
}
   43304:	c3                   	retq   
   43305:	48 89 f8             	mov    %rdi,%rax
   43308:	c3                   	retq   

0000000000043309 <rand>:
    if (!rand_seed_set) {
   43309:	83 3d f4 3c 01 00 00 	cmpl   $0x0,0x13cf4(%rip)        # 57004 <rand_seed_set>
   43310:	74 1b                	je     4332d <rand+0x24>
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43312:	69 05 e4 3c 01 00 0d 	imul   $0x19660d,0x13ce4(%rip),%eax        # 57000 <rand_seed>
   43319:	66 19 00 
   4331c:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43321:	89 05 d9 3c 01 00    	mov    %eax,0x13cd9(%rip)        # 57000 <rand_seed>
    return rand_seed & RAND_MAX;
   43327:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   4332c:	c3                   	retq   
    rand_seed = seed;
   4332d:	c7 05 c9 3c 01 00 9e 	movl   $0x30d4879e,0x13cc9(%rip)        # 57000 <rand_seed>
   43334:	87 d4 30 
    rand_seed_set = 1;
   43337:	c7 05 c3 3c 01 00 01 	movl   $0x1,0x13cc3(%rip)        # 57004 <rand_seed_set>
   4333e:	00 00 00 
}
   43341:	eb cf                	jmp    43312 <rand+0x9>

0000000000043343 <srand>:
    rand_seed = seed;
   43343:	89 3d b7 3c 01 00    	mov    %edi,0x13cb7(%rip)        # 57000 <rand_seed>
    rand_seed_set = 1;
   43349:	c7 05 b1 3c 01 00 01 	movl   $0x1,0x13cb1(%rip)        # 57004 <rand_seed_set>
   43350:	00 00 00 
}
   43353:	c3                   	retq   

0000000000043354 <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   43354:	55                   	push   %rbp
   43355:	48 89 e5             	mov    %rsp,%rbp
   43358:	41 57                	push   %r15
   4335a:	41 56                	push   %r14
   4335c:	41 55                	push   %r13
   4335e:	41 54                	push   %r12
   43360:	53                   	push   %rbx
   43361:	48 83 ec 58          	sub    $0x58,%rsp
   43365:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
   43369:	0f b6 02             	movzbl (%rdx),%eax
   4336c:	84 c0                	test   %al,%al
   4336e:	0f 84 b0 06 00 00    	je     43a24 <printer_vprintf+0x6d0>
   43374:	49 89 fe             	mov    %rdi,%r14
   43377:	49 89 d4             	mov    %rdx,%r12
            length = 1;
   4337a:	41 89 f7             	mov    %esi,%r15d
   4337d:	e9 a4 04 00 00       	jmpq   43826 <printer_vprintf+0x4d2>
        for (++format; *format; ++format) {
   43382:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   43387:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   4338d:	45 84 e4             	test   %r12b,%r12b
   43390:	0f 84 82 06 00 00    	je     43a18 <printer_vprintf+0x6c4>
        int flags = 0;
   43396:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   4339c:	41 0f be f4          	movsbl %r12b,%esi
   433a0:	bf 21 48 04 00       	mov    $0x44821,%edi
   433a5:	e8 37 ff ff ff       	callq  432e1 <strchr>
   433aa:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   433ad:	48 85 c0             	test   %rax,%rax
   433b0:	74 55                	je     43407 <printer_vprintf+0xb3>
                flags |= 1 << (flagc - flag_chars);
   433b2:	48 81 e9 21 48 04 00 	sub    $0x44821,%rcx
   433b9:	b8 01 00 00 00       	mov    $0x1,%eax
   433be:	d3 e0                	shl    %cl,%eax
   433c0:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   433c3:	48 83 c3 01          	add    $0x1,%rbx
   433c7:	44 0f b6 23          	movzbl (%rbx),%r12d
   433cb:	45 84 e4             	test   %r12b,%r12b
   433ce:	75 cc                	jne    4339c <printer_vprintf+0x48>
   433d0:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
        int width = -1;
   433d4:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   433da:	c7 45 9c ff ff ff ff 	movl   $0xffffffff,-0x64(%rbp)
        if (*format == '.') {
   433e1:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   433e4:	0f 84 a9 00 00 00    	je     43493 <printer_vprintf+0x13f>
        int length = 0;
   433ea:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
   433ef:	0f b6 13             	movzbl (%rbx),%edx
   433f2:	8d 42 bd             	lea    -0x43(%rdx),%eax
   433f5:	3c 37                	cmp    $0x37,%al
   433f7:	0f 87 c4 04 00 00    	ja     438c1 <printer_vprintf+0x56d>
   433fd:	0f b6 c0             	movzbl %al,%eax
   43400:	ff 24 c5 30 46 04 00 	jmpq   *0x44630(,%rax,8)
        if (*format >= '1' && *format <= '9') {
   43407:	44 89 6d a8          	mov    %r13d,-0x58(%rbp)
   4340b:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   43410:	3c 08                	cmp    $0x8,%al
   43412:	77 2f                	ja     43443 <printer_vprintf+0xef>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43414:	0f b6 03             	movzbl (%rbx),%eax
   43417:	8d 50 d0             	lea    -0x30(%rax),%edx
   4341a:	80 fa 09             	cmp    $0x9,%dl
   4341d:	77 5e                	ja     4347d <printer_vprintf+0x129>
   4341f:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   43425:	48 83 c3 01          	add    $0x1,%rbx
   43429:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   4342e:	0f be c0             	movsbl %al,%eax
   43431:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43436:	0f b6 03             	movzbl (%rbx),%eax
   43439:	8d 50 d0             	lea    -0x30(%rax),%edx
   4343c:	80 fa 09             	cmp    $0x9,%dl
   4343f:	76 e4                	jbe    43425 <printer_vprintf+0xd1>
   43441:	eb 97                	jmp    433da <printer_vprintf+0x86>
        } else if (*format == '*') {
   43443:	41 80 fc 2a          	cmp    $0x2a,%r12b
   43447:	75 3f                	jne    43488 <printer_vprintf+0x134>
            width = va_arg(val, int);
   43449:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4344d:	8b 07                	mov    (%rdi),%eax
   4344f:	83 f8 2f             	cmp    $0x2f,%eax
   43452:	77 17                	ja     4346b <printer_vprintf+0x117>
   43454:	89 c2                	mov    %eax,%edx
   43456:	48 03 57 10          	add    0x10(%rdi),%rdx
   4345a:	83 c0 08             	add    $0x8,%eax
   4345d:	89 07                	mov    %eax,(%rdi)
   4345f:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   43462:	48 83 c3 01          	add    $0x1,%rbx
   43466:	e9 6f ff ff ff       	jmpq   433da <printer_vprintf+0x86>
            width = va_arg(val, int);
   4346b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4346f:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43473:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43477:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4347b:	eb e2                	jmp    4345f <printer_vprintf+0x10b>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   4347d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   43483:	e9 52 ff ff ff       	jmpq   433da <printer_vprintf+0x86>
        int width = -1;
   43488:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   4348e:	e9 47 ff ff ff       	jmpq   433da <printer_vprintf+0x86>
            ++format;
   43493:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   43497:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   4349b:	8d 48 d0             	lea    -0x30(%rax),%ecx
   4349e:	80 f9 09             	cmp    $0x9,%cl
   434a1:	76 13                	jbe    434b6 <printer_vprintf+0x162>
            } else if (*format == '*') {
   434a3:	3c 2a                	cmp    $0x2a,%al
   434a5:	74 33                	je     434da <printer_vprintf+0x186>
            ++format;
   434a7:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   434aa:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
   434b1:	e9 34 ff ff ff       	jmpq   433ea <printer_vprintf+0x96>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   434b6:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   434bb:	48 83 c2 01          	add    $0x1,%rdx
   434bf:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   434c2:	0f be c0             	movsbl %al,%eax
   434c5:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   434c9:	0f b6 02             	movzbl (%rdx),%eax
   434cc:	8d 70 d0             	lea    -0x30(%rax),%esi
   434cf:	40 80 fe 09          	cmp    $0x9,%sil
   434d3:	76 e6                	jbe    434bb <printer_vprintf+0x167>
                    precision = 10 * precision + *format++ - '0';
   434d5:	48 89 d3             	mov    %rdx,%rbx
   434d8:	eb 1c                	jmp    434f6 <printer_vprintf+0x1a2>
                precision = va_arg(val, int);
   434da:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   434de:	8b 07                	mov    (%rdi),%eax
   434e0:	83 f8 2f             	cmp    $0x2f,%eax
   434e3:	77 23                	ja     43508 <printer_vprintf+0x1b4>
   434e5:	89 c2                	mov    %eax,%edx
   434e7:	48 03 57 10          	add    0x10(%rdi),%rdx
   434eb:	83 c0 08             	add    $0x8,%eax
   434ee:	89 07                	mov    %eax,(%rdi)
   434f0:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   434f2:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   434f6:	85 c9                	test   %ecx,%ecx
   434f8:	b8 00 00 00 00       	mov    $0x0,%eax
   434fd:	0f 49 c1             	cmovns %ecx,%eax
   43500:	89 45 9c             	mov    %eax,-0x64(%rbp)
   43503:	e9 e2 fe ff ff       	jmpq   433ea <printer_vprintf+0x96>
                precision = va_arg(val, int);
   43508:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4350c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43510:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43514:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43518:	eb d6                	jmp    434f0 <printer_vprintf+0x19c>
        switch (*format) {
   4351a:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   4351f:	e9 f3 00 00 00       	jmpq   43617 <printer_vprintf+0x2c3>
            ++format;
   43524:	48 83 c3 01          	add    $0x1,%rbx
            length = 1;
   43528:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
   4352d:	e9 bd fe ff ff       	jmpq   433ef <printer_vprintf+0x9b>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43532:	85 c9                	test   %ecx,%ecx
   43534:	74 55                	je     4358b <printer_vprintf+0x237>
   43536:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4353a:	8b 07                	mov    (%rdi),%eax
   4353c:	83 f8 2f             	cmp    $0x2f,%eax
   4353f:	77 38                	ja     43579 <printer_vprintf+0x225>
   43541:	89 c2                	mov    %eax,%edx
   43543:	48 03 57 10          	add    0x10(%rdi),%rdx
   43547:	83 c0 08             	add    $0x8,%eax
   4354a:	89 07                	mov    %eax,(%rdi)
   4354c:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   4354f:	48 89 d0             	mov    %rdx,%rax
   43552:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   43556:	49 89 d0             	mov    %rdx,%r8
   43559:	49 f7 d8             	neg    %r8
   4355c:	25 80 00 00 00       	and    $0x80,%eax
   43561:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43565:	0b 45 a8             	or     -0x58(%rbp),%eax
   43568:	83 c8 60             	or     $0x60,%eax
   4356b:	89 45 a8             	mov    %eax,-0x58(%rbp)
        char* data = "";
   4356e:	41 bc 27 46 04 00    	mov    $0x44627,%r12d
            break;
   43574:	e9 35 01 00 00       	jmpq   436ae <printer_vprintf+0x35a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43579:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4357d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43581:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43585:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43589:	eb c1                	jmp    4354c <printer_vprintf+0x1f8>
   4358b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   4358f:	8b 07                	mov    (%rdi),%eax
   43591:	83 f8 2f             	cmp    $0x2f,%eax
   43594:	77 10                	ja     435a6 <printer_vprintf+0x252>
   43596:	89 c2                	mov    %eax,%edx
   43598:	48 03 57 10          	add    0x10(%rdi),%rdx
   4359c:	83 c0 08             	add    $0x8,%eax
   4359f:	89 07                	mov    %eax,(%rdi)
   435a1:	48 63 12             	movslq (%rdx),%rdx
   435a4:	eb a9                	jmp    4354f <printer_vprintf+0x1fb>
   435a6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   435aa:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   435ae:	48 8d 42 08          	lea    0x8(%rdx),%rax
   435b2:	48 89 47 08          	mov    %rax,0x8(%rdi)
   435b6:	eb e9                	jmp    435a1 <printer_vprintf+0x24d>
        int base = 10;
   435b8:	be 0a 00 00 00       	mov    $0xa,%esi
   435bd:	eb 58                	jmp    43617 <printer_vprintf+0x2c3>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   435bf:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   435c3:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   435c7:	48 8d 42 08          	lea    0x8(%rdx),%rax
   435cb:	48 89 41 08          	mov    %rax,0x8(%rcx)
   435cf:	eb 60                	jmp    43631 <printer_vprintf+0x2dd>
   435d1:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   435d5:	8b 07                	mov    (%rdi),%eax
   435d7:	83 f8 2f             	cmp    $0x2f,%eax
   435da:	77 10                	ja     435ec <printer_vprintf+0x298>
   435dc:	89 c2                	mov    %eax,%edx
   435de:	48 03 57 10          	add    0x10(%rdi),%rdx
   435e2:	83 c0 08             	add    $0x8,%eax
   435e5:	89 07                	mov    %eax,(%rdi)
   435e7:	44 8b 02             	mov    (%rdx),%r8d
   435ea:	eb 48                	jmp    43634 <printer_vprintf+0x2e0>
   435ec:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   435f0:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   435f4:	48 8d 42 08          	lea    0x8(%rdx),%rax
   435f8:	48 89 41 08          	mov    %rax,0x8(%rcx)
   435fc:	eb e9                	jmp    435e7 <printer_vprintf+0x293>
   435fe:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   43601:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
    const char* digits = upper_digits;
   43608:	bf 10 48 04 00       	mov    $0x44810,%edi
   4360d:	e9 e2 02 00 00       	jmpq   438f4 <printer_vprintf+0x5a0>
            base = 16;
   43612:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43617:	85 c9                	test   %ecx,%ecx
   43619:	74 b6                	je     435d1 <printer_vprintf+0x27d>
   4361b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4361f:	8b 01                	mov    (%rcx),%eax
   43621:	83 f8 2f             	cmp    $0x2f,%eax
   43624:	77 99                	ja     435bf <printer_vprintf+0x26b>
   43626:	89 c2                	mov    %eax,%edx
   43628:	48 03 51 10          	add    0x10(%rcx),%rdx
   4362c:	83 c0 08             	add    $0x8,%eax
   4362f:	89 01                	mov    %eax,(%rcx)
   43631:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   43634:	83 4d a8 20          	orl    $0x20,-0x58(%rbp)
    if (base < 0) {
   43638:	85 f6                	test   %esi,%esi
   4363a:	79 c2                	jns    435fe <printer_vprintf+0x2aa>
        base = -base;
   4363c:	41 89 f1             	mov    %esi,%r9d
   4363f:	f7 de                	neg    %esi
   43641:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%rbp)
        digits = lower_digits;
   43648:	bf f0 47 04 00       	mov    $0x447f0,%edi
   4364d:	e9 a2 02 00 00       	jmpq   438f4 <printer_vprintf+0x5a0>
            num = (uintptr_t) va_arg(val, void*);
   43652:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43656:	8b 07                	mov    (%rdi),%eax
   43658:	83 f8 2f             	cmp    $0x2f,%eax
   4365b:	77 1c                	ja     43679 <printer_vprintf+0x325>
   4365d:	89 c2                	mov    %eax,%edx
   4365f:	48 03 57 10          	add    0x10(%rdi),%rdx
   43663:	83 c0 08             	add    $0x8,%eax
   43666:	89 07                	mov    %eax,(%rdi)
   43668:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   4366b:	81 4d a8 21 01 00 00 	orl    $0x121,-0x58(%rbp)
            base = -16;
   43672:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43677:	eb c3                	jmp    4363c <printer_vprintf+0x2e8>
            num = (uintptr_t) va_arg(val, void*);
   43679:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4367d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43681:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43685:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43689:	eb dd                	jmp    43668 <printer_vprintf+0x314>
            data = va_arg(val, char*);
   4368b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   4368f:	8b 01                	mov    (%rcx),%eax
   43691:	83 f8 2f             	cmp    $0x2f,%eax
   43694:	0f 87 a5 01 00 00    	ja     4383f <printer_vprintf+0x4eb>
   4369a:	89 c2                	mov    %eax,%edx
   4369c:	48 03 51 10          	add    0x10(%rcx),%rdx
   436a0:	83 c0 08             	add    $0x8,%eax
   436a3:	89 01                	mov    %eax,(%rcx)
   436a5:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   436a8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
   436ae:	8b 45 a8             	mov    -0x58(%rbp),%eax
   436b1:	83 e0 20             	and    $0x20,%eax
   436b4:	89 45 8c             	mov    %eax,-0x74(%rbp)
   436b7:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   436bd:	0f 85 21 02 00 00    	jne    438e4 <printer_vprintf+0x590>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   436c3:	8b 45 a8             	mov    -0x58(%rbp),%eax
   436c6:	89 45 88             	mov    %eax,-0x78(%rbp)
   436c9:	83 e0 60             	and    $0x60,%eax
   436cc:	83 f8 60             	cmp    $0x60,%eax
   436cf:	0f 84 54 02 00 00    	je     43929 <printer_vprintf+0x5d5>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   436d5:	8b 45 a8             	mov    -0x58(%rbp),%eax
   436d8:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   436db:	48 c7 45 a0 27 46 04 	movq   $0x44627,-0x60(%rbp)
   436e2:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   436e3:	83 f8 21             	cmp    $0x21,%eax
   436e6:	0f 84 79 02 00 00    	je     43965 <printer_vprintf+0x611>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   436ec:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   436ef:	89 f8                	mov    %edi,%eax
   436f1:	f7 d0                	not    %eax
   436f3:	c1 e8 1f             	shr    $0x1f,%eax
   436f6:	89 45 84             	mov    %eax,-0x7c(%rbp)
   436f9:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   436fd:	0f 85 9e 02 00 00    	jne    439a1 <printer_vprintf+0x64d>
   43703:	84 c0                	test   %al,%al
   43705:	0f 84 96 02 00 00    	je     439a1 <printer_vprintf+0x64d>
            len = strnlen(data, precision);
   4370b:	48 63 f7             	movslq %edi,%rsi
   4370e:	4c 89 e7             	mov    %r12,%rdi
   43711:	e8 63 fb ff ff       	callq  43279 <strnlen>
   43716:	89 45 98             	mov    %eax,-0x68(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   43719:	8b 45 88             	mov    -0x78(%rbp),%eax
   4371c:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
   4371f:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   43726:	83 f8 22             	cmp    $0x22,%eax
   43729:	0f 84 aa 02 00 00    	je     439d9 <printer_vprintf+0x685>
        width -= len + zeros + strlen(prefix);
   4372f:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43733:	e8 26 fb ff ff       	callq  4325e <strlen>
   43738:	8b 55 9c             	mov    -0x64(%rbp),%edx
   4373b:	03 55 98             	add    -0x68(%rbp),%edx
   4373e:	44 89 e9             	mov    %r13d,%ecx
   43741:	29 d1                	sub    %edx,%ecx
   43743:	29 c1                	sub    %eax,%ecx
   43745:	89 4d 8c             	mov    %ecx,-0x74(%rbp)
   43748:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   4374b:	f6 45 a8 04          	testb  $0x4,-0x58(%rbp)
   4374f:	75 2d                	jne    4377e <printer_vprintf+0x42a>
   43751:	85 c9                	test   %ecx,%ecx
   43753:	7e 29                	jle    4377e <printer_vprintf+0x42a>
            p->putc(p, ' ', color);
   43755:	44 89 fa             	mov    %r15d,%edx
   43758:	be 20 00 00 00       	mov    $0x20,%esi
   4375d:	4c 89 f7             	mov    %r14,%rdi
   43760:	41 ff 16             	callq  *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43763:	41 83 ed 01          	sub    $0x1,%r13d
   43767:	45 85 ed             	test   %r13d,%r13d
   4376a:	7f e9                	jg     43755 <printer_vprintf+0x401>
   4376c:	8b 7d 8c             	mov    -0x74(%rbp),%edi
   4376f:	85 ff                	test   %edi,%edi
   43771:	b8 01 00 00 00       	mov    $0x1,%eax
   43776:	0f 4f c7             	cmovg  %edi,%eax
   43779:	29 c7                	sub    %eax,%edi
   4377b:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   4377e:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   43782:	0f b6 07             	movzbl (%rdi),%eax
   43785:	84 c0                	test   %al,%al
   43787:	74 22                	je     437ab <printer_vprintf+0x457>
   43789:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4378d:	48 89 fb             	mov    %rdi,%rbx
            p->putc(p, *prefix, color);
   43790:	0f b6 f0             	movzbl %al,%esi
   43793:	44 89 fa             	mov    %r15d,%edx
   43796:	4c 89 f7             	mov    %r14,%rdi
   43799:	41 ff 16             	callq  *(%r14)
        for (; *prefix; ++prefix) {
   4379c:	48 83 c3 01          	add    $0x1,%rbx
   437a0:	0f b6 03             	movzbl (%rbx),%eax
   437a3:	84 c0                	test   %al,%al
   437a5:	75 e9                	jne    43790 <printer_vprintf+0x43c>
   437a7:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; zeros > 0; --zeros) {
   437ab:	8b 45 9c             	mov    -0x64(%rbp),%eax
   437ae:	85 c0                	test   %eax,%eax
   437b0:	7e 1d                	jle    437cf <printer_vprintf+0x47b>
   437b2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   437b6:	89 c3                	mov    %eax,%ebx
            p->putc(p, '0', color);
   437b8:	44 89 fa             	mov    %r15d,%edx
   437bb:	be 30 00 00 00       	mov    $0x30,%esi
   437c0:	4c 89 f7             	mov    %r14,%rdi
   437c3:	41 ff 16             	callq  *(%r14)
        for (; zeros > 0; --zeros) {
   437c6:	83 eb 01             	sub    $0x1,%ebx
   437c9:	75 ed                	jne    437b8 <printer_vprintf+0x464>
   437cb:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; len > 0; ++data, --len) {
   437cf:	8b 45 98             	mov    -0x68(%rbp),%eax
   437d2:	85 c0                	test   %eax,%eax
   437d4:	7e 27                	jle    437fd <printer_vprintf+0x4a9>
   437d6:	89 c0                	mov    %eax,%eax
   437d8:	4c 01 e0             	add    %r12,%rax
   437db:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   437df:	48 89 c3             	mov    %rax,%rbx
            p->putc(p, *data, color);
   437e2:	41 0f b6 34 24       	movzbl (%r12),%esi
   437e7:	44 89 fa             	mov    %r15d,%edx
   437ea:	4c 89 f7             	mov    %r14,%rdi
   437ed:	41 ff 16             	callq  *(%r14)
        for (; len > 0; ++data, --len) {
   437f0:	49 83 c4 01          	add    $0x1,%r12
   437f4:	49 39 dc             	cmp    %rbx,%r12
   437f7:	75 e9                	jne    437e2 <printer_vprintf+0x48e>
   437f9:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
        for (; width > 0; --width) {
   437fd:	45 85 ed             	test   %r13d,%r13d
   43800:	7e 14                	jle    43816 <printer_vprintf+0x4c2>
            p->putc(p, ' ', color);
   43802:	44 89 fa             	mov    %r15d,%edx
   43805:	be 20 00 00 00       	mov    $0x20,%esi
   4380a:	4c 89 f7             	mov    %r14,%rdi
   4380d:	41 ff 16             	callq  *(%r14)
        for (; width > 0; --width) {
   43810:	41 83 ed 01          	sub    $0x1,%r13d
   43814:	75 ec                	jne    43802 <printer_vprintf+0x4ae>
    for (; *format; ++format) {
   43816:	4c 8d 63 01          	lea    0x1(%rbx),%r12
   4381a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   4381e:	84 c0                	test   %al,%al
   43820:	0f 84 fe 01 00 00    	je     43a24 <printer_vprintf+0x6d0>
        if (*format != '%') {
   43826:	3c 25                	cmp    $0x25,%al
   43828:	0f 84 54 fb ff ff    	je     43382 <printer_vprintf+0x2e>
            p->putc(p, *format, color);
   4382e:	0f b6 f0             	movzbl %al,%esi
   43831:	44 89 fa             	mov    %r15d,%edx
   43834:	4c 89 f7             	mov    %r14,%rdi
   43837:	41 ff 16             	callq  *(%r14)
            continue;
   4383a:	4c 89 e3             	mov    %r12,%rbx
   4383d:	eb d7                	jmp    43816 <printer_vprintf+0x4c2>
            data = va_arg(val, char*);
   4383f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43843:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43847:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4384b:	48 89 47 08          	mov    %rax,0x8(%rdi)
   4384f:	e9 51 fe ff ff       	jmpq   436a5 <printer_vprintf+0x351>
            color = va_arg(val, int);
   43854:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43858:	8b 07                	mov    (%rdi),%eax
   4385a:	83 f8 2f             	cmp    $0x2f,%eax
   4385d:	77 10                	ja     4386f <printer_vprintf+0x51b>
   4385f:	89 c2                	mov    %eax,%edx
   43861:	48 03 57 10          	add    0x10(%rdi),%rdx
   43865:	83 c0 08             	add    $0x8,%eax
   43868:	89 07                	mov    %eax,(%rdi)
   4386a:	44 8b 3a             	mov    (%rdx),%r15d
            goto done;
   4386d:	eb a7                	jmp    43816 <printer_vprintf+0x4c2>
            color = va_arg(val, int);
   4386f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43873:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43877:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4387b:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4387f:	eb e9                	jmp    4386a <printer_vprintf+0x516>
            numbuf[0] = va_arg(val, int);
   43881:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43885:	8b 01                	mov    (%rcx),%eax
   43887:	83 f8 2f             	cmp    $0x2f,%eax
   4388a:	77 23                	ja     438af <printer_vprintf+0x55b>
   4388c:	89 c2                	mov    %eax,%edx
   4388e:	48 03 51 10          	add    0x10(%rcx),%rdx
   43892:	83 c0 08             	add    $0x8,%eax
   43895:	89 01                	mov    %eax,(%rcx)
   43897:	8b 02                	mov    (%rdx),%eax
   43899:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   4389c:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   438a0:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   438a4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   438aa:	e9 ff fd ff ff       	jmpq   436ae <printer_vprintf+0x35a>
            numbuf[0] = va_arg(val, int);
   438af:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   438b3:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   438b7:	48 8d 42 08          	lea    0x8(%rdx),%rax
   438bb:	48 89 47 08          	mov    %rax,0x8(%rdi)
   438bf:	eb d6                	jmp    43897 <printer_vprintf+0x543>
            numbuf[0] = (*format ? *format : '%');
   438c1:	84 d2                	test   %dl,%dl
   438c3:	0f 85 39 01 00 00    	jne    43a02 <printer_vprintf+0x6ae>
   438c9:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   438cd:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   438d1:	48 83 eb 01          	sub    $0x1,%rbx
            data = numbuf;
   438d5:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   438d9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   438df:	e9 ca fd ff ff       	jmpq   436ae <printer_vprintf+0x35a>
        if (flags & FLAG_NUMERIC) {
   438e4:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   438ea:	bf 10 48 04 00       	mov    $0x44810,%edi
        if (flags & FLAG_NUMERIC) {
   438ef:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   438f4:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   438f8:	4c 89 c1             	mov    %r8,%rcx
   438fb:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
   438ff:	48 63 f6             	movslq %esi,%rsi
   43902:	49 83 ec 01          	sub    $0x1,%r12
   43906:	48 89 c8             	mov    %rcx,%rax
   43909:	ba 00 00 00 00       	mov    $0x0,%edx
   4390e:	48 f7 f6             	div    %rsi
   43911:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   43915:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
   43919:	48 89 ca             	mov    %rcx,%rdx
   4391c:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   4391f:	48 39 d6             	cmp    %rdx,%rsi
   43922:	76 de                	jbe    43902 <printer_vprintf+0x5ae>
   43924:	e9 9a fd ff ff       	jmpq   436c3 <printer_vprintf+0x36f>
                prefix = "-";
   43929:	48 c7 45 a0 24 46 04 	movq   $0x44624,-0x60(%rbp)
   43930:	00 
            if (flags & FLAG_NEGATIVE) {
   43931:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43934:	a8 80                	test   $0x80,%al
   43936:	0f 85 b0 fd ff ff    	jne    436ec <printer_vprintf+0x398>
                prefix = "+";
   4393c:	48 c7 45 a0 1f 46 04 	movq   $0x4461f,-0x60(%rbp)
   43943:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
   43944:	a8 10                	test   $0x10,%al
   43946:	0f 85 a0 fd ff ff    	jne    436ec <printer_vprintf+0x398>
                prefix = " ";
   4394c:	a8 08                	test   $0x8,%al
   4394e:	ba 27 46 04 00       	mov    $0x44627,%edx
   43953:	b8 26 46 04 00       	mov    $0x44626,%eax
   43958:	48 0f 44 c2          	cmove  %rdx,%rax
   4395c:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   43960:	e9 87 fd ff ff       	jmpq   436ec <printer_vprintf+0x398>
                   && (base == 16 || base == -16)
   43965:	41 8d 41 10          	lea    0x10(%r9),%eax
   43969:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   4396e:	0f 85 78 fd ff ff    	jne    436ec <printer_vprintf+0x398>
                   && (num || (flags & FLAG_ALT2))) {
   43974:	4d 85 c0             	test   %r8,%r8
   43977:	75 0d                	jne    43986 <printer_vprintf+0x632>
   43979:	f7 45 a8 00 01 00 00 	testl  $0x100,-0x58(%rbp)
   43980:	0f 84 66 fd ff ff    	je     436ec <printer_vprintf+0x398>
            prefix = (base == -16 ? "0x" : "0X");
   43986:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   4398a:	ba 28 46 04 00       	mov    $0x44628,%edx
   4398f:	b8 21 46 04 00       	mov    $0x44621,%eax
   43994:	48 0f 44 c2          	cmove  %rdx,%rax
   43998:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   4399c:	e9 4b fd ff ff       	jmpq   436ec <printer_vprintf+0x398>
            len = strlen(data);
   439a1:	4c 89 e7             	mov    %r12,%rdi
   439a4:	e8 b5 f8 ff ff       	callq  4325e <strlen>
   439a9:	89 45 98             	mov    %eax,-0x68(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   439ac:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
   439b0:	0f 84 63 fd ff ff    	je     43719 <printer_vprintf+0x3c5>
   439b6:	80 7d 84 00          	cmpb   $0x0,-0x7c(%rbp)
   439ba:	0f 84 59 fd ff ff    	je     43719 <printer_vprintf+0x3c5>
            zeros = precision > len ? precision - len : 0;
   439c0:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   439c3:	89 ca                	mov    %ecx,%edx
   439c5:	29 c2                	sub    %eax,%edx
   439c7:	39 c1                	cmp    %eax,%ecx
   439c9:	b8 00 00 00 00       	mov    $0x0,%eax
   439ce:	0f 4e d0             	cmovle %eax,%edx
   439d1:	89 55 9c             	mov    %edx,-0x64(%rbp)
   439d4:	e9 56 fd ff ff       	jmpq   4372f <printer_vprintf+0x3db>
                   && len + (int) strlen(prefix) < width) {
   439d9:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
   439dd:	e8 7c f8 ff ff       	callq  4325e <strlen>
   439e2:	8b 7d 98             	mov    -0x68(%rbp),%edi
   439e5:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
   439e8:	44 89 e9             	mov    %r13d,%ecx
   439eb:	29 f9                	sub    %edi,%ecx
   439ed:	29 c1                	sub    %eax,%ecx
   439ef:	44 39 ea             	cmp    %r13d,%edx
   439f2:	b8 00 00 00 00       	mov    $0x0,%eax
   439f7:	0f 4d c8             	cmovge %eax,%ecx
   439fa:	89 4d 9c             	mov    %ecx,-0x64(%rbp)
   439fd:	e9 2d fd ff ff       	jmpq   4372f <printer_vprintf+0x3db>
            numbuf[0] = (*format ? *format : '%');
   43a02:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
   43a05:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   43a09:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43a0d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   43a13:	e9 96 fc ff ff       	jmpq   436ae <printer_vprintf+0x35a>
        int flags = 0;
   43a18:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   43a1f:	e9 b0 f9 ff ff       	jmpq   433d4 <printer_vprintf+0x80>
}
   43a24:	48 83 c4 58          	add    $0x58,%rsp
   43a28:	5b                   	pop    %rbx
   43a29:	41 5c                	pop    %r12
   43a2b:	41 5d                	pop    %r13
   43a2d:	41 5e                	pop    %r14
   43a2f:	41 5f                	pop    %r15
   43a31:	5d                   	pop    %rbp
   43a32:	c3                   	retq   

0000000000043a33 <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   43a33:	55                   	push   %rbp
   43a34:	48 89 e5             	mov    %rsp,%rbp
   43a37:	48 83 ec 10          	sub    $0x10,%rsp
    cp.p.putc = console_putc;
   43a3b:	48 c7 45 f0 3e 31 04 	movq   $0x4313e,-0x10(%rbp)
   43a42:	00 
        cpos = 0;
   43a43:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
   43a49:	b8 00 00 00 00       	mov    $0x0,%eax
   43a4e:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
   43a51:	48 63 ff             	movslq %edi,%rdi
   43a54:	48 8d 84 3f 00 80 0b 	lea    0xb8000(%rdi,%rdi,1),%rax
   43a5b:	00 
   43a5c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   43a60:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   43a64:	e8 eb f8 ff ff       	callq  43354 <printer_vprintf>
    return cp.cursor - console;
   43a69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43a6d:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   43a73:	48 d1 f8             	sar    %rax
}
   43a76:	c9                   	leaveq 
   43a77:	c3                   	retq   

0000000000043a78 <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
   43a78:	55                   	push   %rbp
   43a79:	48 89 e5             	mov    %rsp,%rbp
   43a7c:	48 83 ec 50          	sub    $0x50,%rsp
   43a80:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43a84:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43a88:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   43a8c:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   43a93:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43a97:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43a9b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43a9f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   43aa3:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   43aa7:	e8 87 ff ff ff       	callq  43a33 <console_vprintf>
}
   43aac:	c9                   	leaveq 
   43aad:	c3                   	retq   

0000000000043aae <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   43aae:	55                   	push   %rbp
   43aaf:	48 89 e5             	mov    %rsp,%rbp
   43ab2:	53                   	push   %rbx
   43ab3:	48 83 ec 28          	sub    $0x28,%rsp
   43ab7:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
   43aba:	48 c7 45 d8 c4 31 04 	movq   $0x431c4,-0x28(%rbp)
   43ac1:	00 
    sp.s = s;
   43ac2:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
   43ac6:	48 85 f6             	test   %rsi,%rsi
   43ac9:	75 0b                	jne    43ad6 <vsnprintf+0x28>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
   43acb:	8b 45 e0             	mov    -0x20(%rbp),%eax
   43ace:	29 d8                	sub    %ebx,%eax
}
   43ad0:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43ad4:	c9                   	leaveq 
   43ad5:	c3                   	retq   
        sp.end = s + size - 1;
   43ad6:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
   43adb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   43adf:	be 00 00 00 00       	mov    $0x0,%esi
   43ae4:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   43ae8:	e8 67 f8 ff ff       	callq  43354 <printer_vprintf>
        *sp.s = 0;
   43aed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43af1:	c6 00 00             	movb   $0x0,(%rax)
   43af4:	eb d5                	jmp    43acb <vsnprintf+0x1d>

0000000000043af6 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   43af6:	55                   	push   %rbp
   43af7:	48 89 e5             	mov    %rsp,%rbp
   43afa:	48 83 ec 50          	sub    $0x50,%rsp
   43afe:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43b02:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43b06:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   43b0a:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   43b11:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43b15:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43b19:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43b1d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
   43b21:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   43b25:	e8 84 ff ff ff       	callq  43aae <vsnprintf>
    va_end(val);
    return n;
}
   43b2a:	c9                   	leaveq 
   43b2b:	c3                   	retq   

0000000000043b2c <console_clear>:

// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   43b2c:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   43b31:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
   43b36:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   43b3b:	48 83 c0 02          	add    $0x2,%rax
   43b3f:	48 39 d0             	cmp    %rdx,%rax
   43b42:	75 f2                	jne    43b36 <console_clear+0xa>
    }
    cursorpos = 0;
   43b44:	c7 05 ae 54 07 00 00 	movl   $0x0,0x754ae(%rip)        # b8ffc <cursorpos>
   43b4b:	00 00 00 
}
   43b4e:	c3                   	retq   
