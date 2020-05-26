
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 e2 2f 00 00    	push   QWORD PTR [rip+0x2fe2]        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmp    QWORD PTR [rip+0x2fe4]        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001030 <puts@plt>:
    1030:	ff 25 e2 2f 00 00    	jmp    QWORD PTR [rip+0x2fe2]        # 4018 <puts@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <.plt>

0000000000001040 <__stack_chk_fail@plt>:
    1040:	ff 25 da 2f 00 00    	jmp    QWORD PTR [rip+0x2fda]        # 4020 <__stack_chk_fail@GLIBC_2.4>
    1046:	68 01 00 00 00       	push   0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <.plt>

0000000000001050 <__isoc99_scanf@plt>:
    1050:	ff 25 d2 2f 00 00    	jmp    QWORD PTR [rip+0x2fd2]        # 4028 <__isoc99_scanf@GLIBC_2.7>
    1056:	68 02 00 00 00       	push   0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <.plt>

Disassembly of section .text:

0000000000001060 <_start>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	31 ed                	xor    ebp,ebp
    1066:	49 89 d1             	mov    r9,rdx
    1069:	5e                   	pop    rsi
    106a:	48 89 e2             	mov    rdx,rsp
    106d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1071:	50                   	push   rax
    1072:	54                   	push   rsp
    1073:	4c 8d 05 16 02 00 00 	lea    r8,[rip+0x216]        # 1290 <__libc_csu_fini>
    107a:	48 8d 0d 9f 01 00 00 	lea    rcx,[rip+0x19f]        # 1220 <__libc_csu_init>
    1081:	48 8d 3d 1e 01 00 00 	lea    rdi,[rip+0x11e]        # 11a6 <main>
    1088:	ff 15 52 2f 00 00    	call   QWORD PTR [rip+0x2f52]        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    108e:	f4                   	hlt    
    108f:	90                   	nop

0000000000001090 <deregister_tm_clones>:
    1090:	48 8d 3d a9 2f 00 00 	lea    rdi,[rip+0x2fa9]        # 4040 <__TMC_END__>
    1097:	48 8d 05 a2 2f 00 00 	lea    rax,[rip+0x2fa2]        # 4040 <__TMC_END__>
    109e:	48 39 f8             	cmp    rax,rdi
    10a1:	74 15                	je     10b8 <deregister_tm_clones+0x28>
    10a3:	48 8b 05 2e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f2e]        # 3fd8 <_ITM_deregisterTMCloneTable>
    10aa:	48 85 c0             	test   rax,rax
    10ad:	74 09                	je     10b8 <deregister_tm_clones+0x28>
    10af:	ff e0                	jmp    rax
    10b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10b8:	c3                   	ret    
    10b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010c0 <register_tm_clones>:
    10c0:	48 8d 3d 79 2f 00 00 	lea    rdi,[rip+0x2f79]        # 4040 <__TMC_END__>
    10c7:	48 8d 35 72 2f 00 00 	lea    rsi,[rip+0x2f72]        # 4040 <__TMC_END__>
    10ce:	48 29 fe             	sub    rsi,rdi
    10d1:	48 89 f0             	mov    rax,rsi
    10d4:	48 c1 ee 3f          	shr    rsi,0x3f
    10d8:	48 c1 f8 03          	sar    rax,0x3
    10dc:	48 01 c6             	add    rsi,rax
    10df:	48 d1 fe             	sar    rsi,1
    10e2:	74 14                	je     10f8 <register_tm_clones+0x38>
    10e4:	48 8b 05 05 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f05]        # 3ff0 <_ITM_registerTMCloneTable>
    10eb:	48 85 c0             	test   rax,rax
    10ee:	74 08                	je     10f8 <register_tm_clones+0x38>
    10f0:	ff e0                	jmp    rax
    10f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10f8:	c3                   	ret    
    10f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001100 <__do_global_dtors_aux>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	80 3d 35 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f35],0x0        # 4040 <__TMC_END__>
    110b:	75 33                	jne    1140 <__do_global_dtors_aux+0x40>
    110d:	55                   	push   rbp
    110e:	48 83 3d e2 2e 00 00 	cmp    QWORD PTR [rip+0x2ee2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1115:	00 
    1116:	48 89 e5             	mov    rbp,rsp
    1119:	74 0d                	je     1128 <__do_global_dtors_aux+0x28>
    111b:	48 8b 3d 16 2f 00 00 	mov    rdi,QWORD PTR [rip+0x2f16]        # 4038 <__dso_handle>
    1122:	ff 15 d0 2e 00 00    	call   QWORD PTR [rip+0x2ed0]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1128:	e8 63 ff ff ff       	call   1090 <deregister_tm_clones>
    112d:	c6 05 0c 2f 00 00 01 	mov    BYTE PTR [rip+0x2f0c],0x1        # 4040 <__TMC_END__>
    1134:	5d                   	pop    rbp
    1135:	c3                   	ret    
    1136:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    113d:	00 00 00 
    1140:	c3                   	ret    
    1141:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    1148:	00 00 00 00 
    114c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	e9 67 ff ff ff       	jmp    10c0 <register_tm_clones>

0000000000001159 <control_sum>:
    1159:	55                   	push   rbp
    115a:	48 89 e5             	mov    rbp,rsp
    115d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi       ; помещение аргумента на стек ([rbp-0x18] = arg)
    1161:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0       ; локальная переменная (назовем [rbp-0x10] = a)
    1168:	00 
    1169:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0        ; еще одна локальная переменная (назовем [rbp-0x8] = b)
    1170:	00 
    1171:	eb 1b                	jmp    118e <control_sum+0x35>
    1173:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]       ; rdx = arg            (*)
    1177:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]        ; rdx = b
    117b:	48 01 d0             	add    rax,rdx                        ; rax = b + arg
    117e:	0f b6 00             	movzx  eax,BYTE PTR [rax]             ; eax = arg[b] (byte) (копирование с расширением нулем)
    1181:	48 0f be c0          	movsx  rax,al                         ; копирование с расширением знаком
    1185:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax       ; a += rax (rax = arg[b])   //   суммирование символов
    1189:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1        ; b++
    118e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]       ; rdx = arg
    1192:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]        ; rax = b
    1196:	48 01 d0             	add    rax,rdx                        ; rax += rdx (= arg)
    1199:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    119c:	84 c0                	test   al,al                          ; проверка на 0 arg[b] (b имеется в виду новый), похоже на работу со строками...
    119e:	75 d3                	jne    1173 <control_sum+0x1a>        ; цикл (прыжок на (*))
    11a0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]       ; возвращаемое значение в a
    11a4:	5d                   	pop    rbp
    11a5:	c3                   	ret                                   ; ПОЛУЧАЕТСЯ: функция control_sum возвращает сумму кодов символов в строке

00000000000011a6 <main>:
    11a6:	55                   	push   rbp
    11a7:	48 89 e5             	mov    rbp,rsp
    11aa:	48 83 ec 70          	sub    rsp,0x70
    11ae:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    11b5:	00 00 
    11b7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    11bb:	31 c0                	xor    eax,eax
    11bd:	48 8d 45 90          	lea    rax,[rbp-0x70]                       // address of scanf dest..
    11c1:	48 89 c6             	mov    rsi,rax
    11c4:	48 8d 3d 39 0e 00 00 	lea    rdi,[rip+0xe39]        # 2004 <_IO_stdin_used+0x4> // scanf string with % ??
    11cb:	b8 00 00 00 00       	mov    eax,0x0                      
    11d0:	e8 7b fe ff ff       	call   1050 <__isoc99_scanf@plt>
    11d5:	48 8d 45 90          	lea    rax,[rbp-0x70]               // res of scanf (address where res)
    11d9:	48 89 c7             	mov    rdi,rax
    11dc:	e8 78 ff ff ff       	call   1159 <control_sum>           // control_sum res in eax
    11e1:	48 3d 9a 02 00 00    	cmp    rax,0x29a                    // main cmp
    11e7:	75 0e                	jne    11f7 <main+0x51>
    11e9:	48 8d 3d 17 0e 00 00 	lea    rdi,[rip+0xe17]        # 2007 <_IO_stdin_used+0x7>
    11f0:	e8 3b fe ff ff       	call   1030 <puts@plt>
    11f5:	eb 0c                	jmp    1203 <main+0x5d>
    11f7:	48 8d 3d 19 0e 00 00 	lea    rdi,[rip+0xe19]        # 2017 <_IO_stdin_used+0x17>
    11fe:	e8 2d fe ff ff       	call   1030 <puts@plt>
    1203:	b8 00 00 00 00       	mov    eax,0x0
    1208:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    120c:	64 48 33 14 25 28 00 	xor    rdx,QWORD PTR fs:0x28
    1213:	00 00 
    1215:	74 05                	je     121c <main+0x76>
    1217:	e8 24 fe ff ff       	call   1040 <__stack_chk_fail@plt>
    121c:	c9                   	leave  
    121d:	c3                   	ret    
    121e:	66 90                	xchg   ax,ax

0000000000001220 <__libc_csu_init>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	41 57                	push   r15
    1226:	4c 8d 3d bb 2b 00 00 	lea    r15,[rip+0x2bbb]        # 3de8 <__frame_dummy_init_array_entry>
    122d:	41 56                	push   r14
    122f:	49 89 d6             	mov    r14,rdx
    1232:	41 55                	push   r13
    1234:	49 89 f5             	mov    r13,rsi
    1237:	41 54                	push   r12
    1239:	41 89 fc             	mov    r12d,edi
    123c:	55                   	push   rbp
    123d:	48 8d 2d ac 2b 00 00 	lea    rbp,[rip+0x2bac]        # 3df0 <__do_global_dtors_aux_fini_array_entry>
    1244:	53                   	push   rbx
    1245:	4c 29 fd             	sub    rbp,r15
    1248:	48 83 ec 08          	sub    rsp,0x8
    124c:	e8 af fd ff ff       	call   1000 <_init>
    1251:	48 c1 fd 03          	sar    rbp,0x3
    1255:	74 1f                	je     1276 <__libc_csu_init+0x56>
    1257:	31 db                	xor    ebx,ebx
    1259:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1260:	4c 89 f2             	mov    rdx,r14
    1263:	4c 89 ee             	mov    rsi,r13
    1266:	44 89 e7             	mov    edi,r12d
    1269:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
    126d:	48 83 c3 01          	add    rbx,0x1
    1271:	48 39 dd             	cmp    rbp,rbx
    1274:	75 ea                	jne    1260 <__libc_csu_init+0x40>
    1276:	48 83 c4 08          	add    rsp,0x8
    127a:	5b                   	pop    rbx
    127b:	5d                   	pop    rbp
    127c:	41 5c                	pop    r12
    127e:	41 5d                	pop    r13
    1280:	41 5e                	pop    r14
    1282:	41 5f                	pop    r15
    1284:	c3                   	ret    
    1285:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    128c:	00 00 00 00 

0000000000001290 <__libc_csu_fini>:
    1290:	f3 0f 1e fa          	endbr64 
    1294:	c3                   	ret    

Disassembly of section .fini:

0000000000001298 <_fini>:
    1298:	f3 0f 1e fa          	endbr64 
    129c:	48 83 ec 08          	sub    rsp,0x8
    12a0:	48 83 c4 08          	add    rsp,0x8
    12a4:	c3                   	ret    
