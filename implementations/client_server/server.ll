; ModuleID = 'server.cpp'
source_filename = "server.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%"class.std::__1::set" = type { %"class.std::__1::__tree" }
%"class.std::__1::__tree" = type { %"class.std::__1::__tree_end_node"*, %"class.std::__1::__compressed_pair", %"class.std::__1::__compressed_pair.1" }
%"class.std::__1::__tree_end_node" = type { %"class.std::__1::__tree_node_base"* }
%"class.std::__1::__tree_node_base" = type <{ %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_end_node"*, i8, [7 x i8] }>
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"class.std::__1::__tree_end_node" }
%"class.std::__1::__compressed_pair.1" = type { %"struct.std::__1::__compressed_pair_elem.2" }
%"struct.std::__1::__compressed_pair_elem.2" = type { i64 }
%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.hostent = type { i8*, i8**, i32, i32, i8** }
%struct.sockaddr = type { i8, i8, [14 x i8] }
%"class.std::__1::__tree_const_iterator" = type { %"class.std::__1::__tree_end_node"* }
%"class.std::__1::__tree_iterator" = type { %"class.std::__1::__tree_end_node"* }
%"class.std::__1::__tree_node" = type { %"class.std::__1::__tree_node_base.base", i32 }
%"class.std::__1::__tree_node_base.base" = type <{ %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_end_node"*, i8 }>
%"struct.std::__1::pair" = type <{ %"class.std::__1::__tree_const_iterator", i8, [7 x i8] }>
%"struct.std::__1::pair.4" = type <{ %"class.std::__1::__tree_iterator", i8, [7 x i8] }>
%"struct.std::__1::less" = type { i8 }
%"struct.std::__1::__value_init_tag" = type { i8 }
%"struct.std::__1::__compressed_pair_elem.0" = type { i8 }
%"class.std::__1::allocator" = type { i8 }
%"struct.std::__1::__non_trivial_if" = type { i8 }
%"struct.std::__1::__compressed_pair_elem.3" = type { i8 }
%"class.std::__1::unique_ptr" = type { %"class.std::__1::__compressed_pair.6" }
%"class.std::__1::__compressed_pair.6" = type { %"struct.std::__1::__compressed_pair_elem.7", %"struct.std::__1::__compressed_pair_elem.8" }
%"struct.std::__1::__compressed_pair_elem.7" = type { %"class.std::__1::__tree_node"* }
%"struct.std::__1::__compressed_pair_elem.8" = type { %"class.std::__1::__tree_node_destructor" }
%"class.std::__1::__tree_node_destructor" = type <{ %"class.std::__1::allocator"*, i8, [7 x i8] }>
%"class.std::length_error" = type { %"class.std::logic_error" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }

@__stderrp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [18 x i8] c"%s: unknown host\0A\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"Error getting port of socket\00", align 1
@SEMAPHORE = global i8 1, align 1
@connections = global %"class.std::__1::set" zeroinitializer, align 8
@__dso_handle = external hidden global i8
@.str.2 = private unnamed_addr constant [14 x i8] c"Connections: \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"New connection %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [29 x i8] c"Error reading stream message\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"Client %d says '%s'\0A\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"connect\00", align 1
@.str.10 = private unnamed_addr constant [24 x i8] c"Client %d is connected\0A\00", align 1
@.str.11 = private unnamed_addr constant [49 x i8] c"Server already connected. Client %d is rejected\0A\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"disconnect\00", align 1
@.str.13 = private unnamed_addr constant [27 x i8] c"Client %d is disconnected\0A\00", align 1
@.str.14 = private unnamed_addr constant [47 x i8] c"Client %d is not connected. Disconnect failed\0A\00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"Error opening stream socket\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c"Error setting socket options\00", align 1
@.str.17 = private unnamed_addr constant [28 x i8] c"Error binding stream socket\00", align 1
@.str.18 = private unnamed_addr constant [32 x i8] c"Server listening on port %d...\0A\00", align 1
@.str.19 = private unnamed_addr constant [27 x i8] c"Error accepting connection\00", align 1
@.str.20 = private unnamed_addr constant [26 x i8] c"Usage: ./server port_num\0A\00", align 1
@.str.21 = private unnamed_addr constant [68 x i8] c"allocator<T>::allocate(size_t n) 'n' exceeds maximum supported size\00", align 1
@_ZTISt12length_error = external constant i8*
@_ZTVSt12length_error = external unnamed_addr constant { [5 x i8*] }, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_server.cpp, i8* null }]

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z20make_server_sockaddrP11sockaddr_ini(%struct.sockaddr_in* noundef %addr, i32 noundef %port) #0 {
entry:
  %addr.addr = alloca %struct.sockaddr_in*, align 8
  %port.addr = alloca i32, align 4
  store %struct.sockaddr_in* %addr, %struct.sockaddr_in** %addr.addr, align 8
  store i32 %port, i32* %port.addr, align 4
  %0 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %0, i32 0, i32 1
  store i8 2, i8* %sin_family, align 1
  %1 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %1, i32 0, i32 3
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0
  store i32 0, i32* %s_addr, align 4
  %2 = load i32, i32* %port.addr, align 4
  %3 = call i1 @llvm.is.constant.i32(i32 %2)
  br i1 %3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i32, i32* %port.addr, align 4
  %conv = trunc i32 %4 to i16
  %conv1 = zext i16 %conv to i32
  %and = and i32 %conv1, 65280
  %shr = lshr i32 %and, 8
  %5 = load i32, i32* %port.addr, align 4
  %conv2 = trunc i32 %5 to i16
  %conv3 = zext i16 %conv2 to i32
  %and4 = and i32 %conv3, 255
  %shl = shl i32 %and4, 8
  %or = or i32 %shr, %shl
  %conv5 = trunc i32 %or to i16
  br label %cond.end

cond.false:                                       ; preds = %entry
  %6 = load i32, i32* %port.addr, align 4
  %conv6 = trunc i32 %6 to i16
  %call = call noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %conv6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv5, %cond.true ], [ %call, %cond.false ]
  %7 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %7, i32 0, i32 2
  store i16 %cond, i16* %sin_port, align 2
  ret i32 0
}

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i32(i32) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %_data) #2 {
entry:
  %_data.addr = alloca i16, align 2
  store i16 %_data, i16* %_data.addr, align 2
  %0 = load i16, i16* %_data.addr, align 2
  %conv = zext i16 %0 to i32
  %shl = shl i32 %conv, 8
  %1 = load i16, i16* %_data.addr, align 2
  %conv1 = zext i16 %1 to i32
  %shr = ashr i32 %conv1, 8
  %or = or i32 %shl, %shr
  %conv2 = trunc i32 %or to i16
  ret i16 %conv2
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z20make_client_sockaddrP11sockaddr_inPKci(%struct.sockaddr_in* noundef %addr, i8* noundef %hostname, i32 noundef %port) #0 {
entry:
  %retval = alloca i32, align 4
  %addr.addr = alloca %struct.sockaddr_in*, align 8
  %hostname.addr = alloca i8*, align 8
  %port.addr = alloca i32, align 4
  %host = alloca %struct.hostent*, align 8
  store %struct.sockaddr_in* %addr, %struct.sockaddr_in** %addr.addr, align 8
  store i8* %hostname, i8** %hostname.addr, align 8
  store i32 %port, i32* %port.addr, align 4
  %0 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %0, i32 0, i32 1
  store i8 2, i8* %sin_family, align 1
  %1 = load i8*, i8** %hostname.addr, align 8
  %call = call %struct.hostent* @gethostbyname(i8* noundef %1)
  store %struct.hostent* %call, %struct.hostent** %host, align 8
  %2 = load %struct.hostent*, %struct.hostent** %host, align 8
  %cmp = icmp eq %struct.hostent* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %4 = load i8*, i8** %hostname.addr, align 8
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* noundef %3, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i8* noundef %4)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %5, i32 0, i32 3
  %6 = bitcast %struct.in_addr* %sin_addr to i8*
  %7 = load %struct.hostent*, %struct.hostent** %host, align 8
  %h_addr_list = getelementptr inbounds %struct.hostent, %struct.hostent* %7, i32 0, i32 4
  %8 = load i8**, i8*** %h_addr_list, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %8, i64 0
  %9 = load i8*, i8** %arrayidx, align 8
  %10 = load %struct.hostent*, %struct.hostent** %host, align 8
  %h_length = getelementptr inbounds %struct.hostent, %struct.hostent* %10, i32 0, i32 3
  %11 = load i32, i32* %h_length, align 4
  %conv = sext i32 %11 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 1 %9, i64 %conv, i1 false)
  %12 = load i32, i32* %port.addr, align 4
  %13 = call i1 @llvm.is.constant.i32(i32 %12)
  br i1 %13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %14 = load i32, i32* %port.addr, align 4
  %conv2 = trunc i32 %14 to i16
  %conv3 = zext i16 %conv2 to i32
  %and = and i32 %conv3, 65280
  %shr = lshr i32 %and, 8
  %15 = load i32, i32* %port.addr, align 4
  %conv4 = trunc i32 %15 to i16
  %conv5 = zext i16 %conv4 to i32
  %and6 = and i32 %conv5, 255
  %shl = shl i32 %and6, 8
  %or = or i32 %shr, %shl
  %conv7 = trunc i32 %or to i16
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %16 = load i32, i32* %port.addr, align 4
  %conv8 = trunc i32 %16 to i16
  %call9 = call noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %conv8)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv7, %cond.true ], [ %call9, %cond.false ]
  %17 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %17, i32 0, i32 2
  store i16 %cond, i16* %sin_port, align 2
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

declare %struct.hostent* @gethostbyname(i8* noundef) #3

declare i32 @fprintf(%struct.__sFILE* noundef, i8* noundef, ...) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z15get_port_numberi(i32 noundef %sockfd) #0 {
entry:
  %retval = alloca i32, align 4
  %sockfd.addr = alloca i32, align 4
  %addr = alloca %struct.sockaddr_in, align 4
  %length = alloca i32, align 4
  store i32 %sockfd, i32* %sockfd.addr, align 4
  store i32 16, i32* %length, align 4
  %0 = load i32, i32* %sockfd.addr, align 4
  %1 = bitcast %struct.sockaddr_in* %addr to %struct.sockaddr*
  %call = call i32 @"\01_getsockname"(i32 noundef %0, %struct.sockaddr* noundef %1, i32* noundef %length)
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0)) #17
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %2 = load i16, i16* %sin_port, align 2
  %3 = call i1 @llvm.is.constant.i16(i16 %2)
  br i1 %3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %sin_port1 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %4 = load i16, i16* %sin_port1, align 2
  %conv = zext i16 %4 to i32
  %and = and i32 %conv, 65280
  %shr = lshr i32 %and, 8
  %sin_port2 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %5 = load i16, i16* %sin_port2, align 2
  %conv3 = zext i16 %5 to i32
  %and4 = and i32 %conv3, 255
  %shl = shl i32 %and4, 8
  %or = or i32 %shr, %shl
  %conv5 = trunc i32 %or to i16
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %sin_port6 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %6 = load i16, i16* %sin_port6, align 2
  %call7 = call noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv5, %cond.true ], [ %call7, %cond.false ]
  %conv8 = zext i16 %cond to i32
  store i32 %conv8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i32 @"\01_getsockname"(i32 noundef, %struct.sockaddr* noundef, i32* noundef) #3

; Function Attrs: cold
declare void @perror(i8* noundef) #5

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #1

; Function Attrs: noinline ssp uwtable
define internal void @__cxx_global_var_init() #6 section "__TEXT,__StaticInit,regular,pure_instructions" {
entry:
  %call = call noundef %"class.std::__1::set"* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEEC1Ev(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) @connections) #8
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (%"class.std::__1::set"* (%"class.std::__1::set"*)* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEED1Ev to void (i8*)*), i8* bitcast (%"class.std::__1::set"* @connections to i8*), i8* @__dso_handle) #8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::set"* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEEC1Ev(%"class.std::__1::set"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::set"*, align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %call = call noundef %"class.std::__1::set"* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEEC2Ev(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  ret %"class.std::__1::set"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::set"* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEED1Ev(%"class.std::__1::set"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::set"*, align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %call = call noundef %"class.std::__1::set"* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEED2Ev(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  ret %"class.std::__1::set"* %this1
}

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #8

; Function Attrs: mustprogress noinline optnone ssp uwtable
define void @_Z17print_connectionsv() #0 {
entry:
  %it = alloca %"class.std::__1::__tree_const_iterator", align 8
  %ref.tmp = alloca %"class.std::__1::__tree_const_iterator", align 8
  %coerce = alloca %"class.std::__1::__tree_const_iterator", align 8
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0))
  %call1 = call i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE5beginEv(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) @connections) #8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %it, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call1 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %call2 = call i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) @connections) #8
  %coerce.dive3 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %ref.tmp, i32 0, i32 0
  %coerce.val.ip4 = inttoptr i64 %call2 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip4, %"class.std::__1::__tree_end_node"** %coerce.dive3, align 8
  %call5 = call noundef zeroext i1 @_ZNSt3__1neERKNS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %it, %"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %ref.tmp)
  br i1 %call5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call6 = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNKSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEdeEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %it)
  %0 = load i32, i32* %call6, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 noundef %0)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %call8 = call i64 @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEppEi(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %it, i32 noundef 0)
  %coerce.dive9 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %coerce, i32 0, i32 0
  %coerce.val.ip10 = inttoptr i64 %call8 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip10, %"class.std::__1::__tree_end_node"** %coerce.dive9, align 8
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %call11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* noundef, ...) #3

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE5beginEv(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_const_iterator", align 8
  %this.addr = alloca %"class.std::__1::set"*, align 8
  %agg.tmp = alloca %"class.std::__1::__tree_iterator", align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %__tree_ = getelementptr inbounds %"class.std::__1::set", %"class.std::__1::set"* %this1, i32 0, i32 0
  %call = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE5beginEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %__tree_) #8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.dive2 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive2, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %0 to i64
  %call3 = call noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC1ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %retval, i64 %coerce.val.pi) #8
  %coerce.dive4 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %retval, i32 0, i32 0
  %1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive4, align 8
  %coerce.val.pi5 = ptrtoint %"class.std::__1::__tree_end_node"* %1 to i64
  ret i64 %coerce.val.pi5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef zeroext i1 @_ZNSt3__1neERKNS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %__x, %"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %__y) #0 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  %__y.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  store %"class.std::__1::__tree_const_iterator"* %__x, %"class.std::__1::__tree_const_iterator"** %__x.addr, align 8
  store %"class.std::__1::__tree_const_iterator"* %__y, %"class.std::__1::__tree_const_iterator"** %__y.addr, align 8
  %0 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %__x.addr, align 8
  %1 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %__y.addr, align 8
  %call = call noundef zeroext i1 @_ZNSt3__1eqERKNS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %0, %"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %1)
  %lnot = xor i1 %call, true
  ret i1 %lnot
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_const_iterator", align 8
  %this.addr = alloca %"class.std::__1::set"*, align 8
  %agg.tmp = alloca %"class.std::__1::__tree_iterator", align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %__tree_ = getelementptr inbounds %"class.std::__1::set", %"class.std::__1::set"* %this1, i32 0, i32 0
  %call = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %__tree_) #8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.dive2 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive2, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %0 to i64
  %call3 = call noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC1ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %retval, i64 %coerce.val.pi) #8
  %coerce.dive4 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %retval, i32 0, i32 0
  %1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive4, align 8
  %coerce.val.pi5 = ptrtoint %"class.std::__1::__tree_end_node"* %1 to i64
  ret i64 %coerce.val.pi5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef nonnull align 4 dereferenceable(4) i32* @_ZNKSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEdeEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %this) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  store %"class.std::__1::__tree_const_iterator"* %this, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElE8__get_npEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %this1)
  %__value_ = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %call, i32 0, i32 1
  ret i32* %__value_
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal i64 @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEppEi(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %this, i32 noundef %0) #0 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_const_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  %.addr = alloca i32, align 4
  store %"class.std::__1::__tree_const_iterator"* %this, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  store i32 %0, i32* %.addr, align 4
  %this1 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_const_iterator"* %retval to i8*
  %2 = bitcast %"class.std::__1::__tree_const_iterator"* %this1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 8, i1 false)
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEppEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %this1)
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %retval, i32 0, i32 0
  %3 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %3 to i64
  ret i64 %coerce.val.pi
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z17handle_connectioni(i32 noundef %connectionfd) #0 {
entry:
  %retval = alloca i32, align 4
  %connectionfd.addr = alloca i32, align 4
  %msg = alloca [257 x i8], align 1
  %recvd = alloca i64, align 8
  %rval = alloca i64, align 8
  %command = alloca i8*, align 8
  %client_id = alloca i32, align 4
  %coerce = alloca %"struct.std::__1::pair", align 8
  %ref.tmp = alloca %"class.std::__1::__tree_const_iterator", align 8
  %ref.tmp22 = alloca %"class.std::__1::__tree_const_iterator", align 8
  store i32 %connectionfd, i32* %connectionfd.addr, align 4
  %0 = load i32, i32* %connectionfd.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i32 noundef %0)
  %arraydecay = getelementptr inbounds [257 x i8], [257 x i8]* %msg, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay, i8 0, i64 257, i1 false)
  store i64 0, i64* %recvd, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %connectionfd.addr, align 4
  %arraydecay1 = getelementptr inbounds [257 x i8], [257 x i8]* %msg, i64 0, i64 0
  %2 = load i64, i64* %recvd, align 8
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 %2
  %3 = load i64, i64* %recvd, align 8
  %sub = sub i64 256, %3
  %call2 = call i64 @"\01_recv"(i32 noundef %1, i8* noundef %add.ptr, i64 noundef %sub, i32 noundef 0)
  store i64 %call2, i64* %rval, align 8
  %4 = load i64, i64* %rval, align 8
  %cmp = icmp eq i64 %4, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @perror(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i64 0, i64 0)) #17
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %do.body
  %5 = load i64, i64* %rval, align 8
  %6 = load i64, i64* %recvd, align 8
  %add = add i64 %6, %5
  store i64 %add, i64* %recvd, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %7 = load i64, i64* %rval, align 8
  %cmp3 = icmp sgt i64 %7, 0
  br i1 %cmp3, label %do.body, label %do.end, !llvm.loop !12

do.end:                                           ; preds = %do.cond
  %arraydecay4 = getelementptr inbounds [257 x i8], [257 x i8]* %msg, i64 0, i64 0
  %call5 = call i8* @strtok(i8* noundef %arraydecay4, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  store i8* %call5, i8** %command, align 8
  %call6 = call i8* @strtok(i8* noundef null, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  %call7 = call i32 @atoi(i8* noundef %call6)
  store i32 %call7, i32* %client_id, align 4
  %8 = load i32, i32* %client_id, align 4
  %9 = load i8*, i8** %command, align 8
  %call8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i64 0, i64 0), i32 noundef %8, i8* noundef %9)
  %10 = load i8*, i8** %command, align 8
  %call9 = call i32 @strcmp(i8* noundef %10, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0))
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end17

if.then11:                                        ; preds = %do.end
  %11 = load i8, i8* @SEMAPHORE, align 1
  %tobool = trunc i8 %11 to i1
  br i1 %tobool, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.then11
  %12 = load i32, i32* %client_id, align 4
  %call13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.10, i64 0, i64 0), i32 noundef %12)
  store i8 0, i8* @SEMAPHORE, align 1
  %call14 = call [2 x i64] @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE6insertERKi(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) @connections, i32* noundef nonnull align 4 dereferenceable(4) %client_id)
  %13 = bitcast %"struct.std::__1::pair"* %coerce to [2 x i64]*
  store [2 x i64] %call14, [2 x i64]* %13, align 8
  br label %if.end16

if.else:                                          ; preds = %if.then11
  %14 = load i32, i32* %client_id, align 4
  %call15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i32 noundef %14)
  br label %if.end16

if.end16:                                         ; preds = %if.else, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %do.end
  %15 = load i8*, i8** %command, align 8
  %call18 = call i32 @strcmp(i8* noundef %15, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i64 0, i64 0))
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.then20, label %if.end33

if.then20:                                        ; preds = %if.end17
  %call21 = call i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE4findERKi(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) @connections, i32* noundef nonnull align 4 dereferenceable(4) %client_id)
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %ref.tmp, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call21 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %call23 = call i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) @connections) #8
  %coerce.dive24 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %ref.tmp22, i32 0, i32 0
  %coerce.val.ip25 = inttoptr i64 %call23 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip25, %"class.std::__1::__tree_end_node"** %coerce.dive24, align 8
  %call26 = call noundef zeroext i1 @_ZNSt3__1neERKNS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %ref.tmp, %"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %ref.tmp22)
  br i1 %call26, label %if.then27, label %if.else30

if.then27:                                        ; preds = %if.then20
  %call28 = call noundef i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE5eraseERKi(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) @connections, i32* noundef nonnull align 4 dereferenceable(4) %client_id)
  store i8 1, i8* @SEMAPHORE, align 1
  %16 = load i32, i32* %client_id, align 4
  %call29 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.13, i64 0, i64 0), i32 noundef %16)
  br label %if.end32

if.else30:                                        ; preds = %if.then20
  %17 = load i32, i32* %client_id, align 4
  %call31 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.14, i64 0, i64 0), i32 noundef %17)
  br label %if.end32

if.end32:                                         ; preds = %if.else30, %if.then27
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end17
  call void @_Z17print_connectionsv()
  %18 = load i32, i32* %connectionfd.addr, align 4
  %call34 = call i32 @"\01_close"(i32 noundef %18)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #9

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #3

declare i8* @strtok(i8* noundef, i8* noundef) #3

declare i32 @atoi(i8* noundef) #3

declare i32 @strcmp(i8* noundef, i8* noundef) #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal [2 x i64] @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE6insertERKi(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__v) #0 align 2 {
entry:
  %retval = alloca %"struct.std::__1::pair", align 8
  %this.addr = alloca %"class.std::__1::set"*, align 8
  %__v.addr = alloca i32*, align 8
  %ref.tmp = alloca %"struct.std::__1::pair.4", align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  store i32* %__v, i32** %__v.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %__tree_ = getelementptr inbounds %"class.std::__1::set", %"class.std::__1::set"* %this1, i32 0, i32 0
  %0 = load i32*, i32** %__v.addr, align 8
  %call = call [2 x i64] @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE15__insert_uniqueERKi(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %__tree_, i32* noundef nonnull align 4 dereferenceable(4) %0)
  %1 = bitcast %"struct.std::__1::pair.4"* %ref.tmp to [2 x i64]*
  store [2 x i64] %call, [2 x i64]* %1, align 8
  %call2 = call noundef %"struct.std::__1::pair"* @_ZNSt3__14pairINS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC1INS_15__tree_iteratorIiS5_lEEbLb0EEEONS0_IT_T0_EE(%"struct.std::__1::pair"* noundef nonnull align 8 dereferenceable(9) %retval, %"struct.std::__1::pair.4"* noundef nonnull align 8 dereferenceable(9) %ref.tmp) #8
  %2 = bitcast %"struct.std::__1::pair"* %retval to [2 x i64]*
  %3 = load [2 x i64], [2 x i64]* %2, align 8
  ret [2 x i64] %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE4findERKi(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__k) #0 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_const_iterator", align 8
  %this.addr = alloca %"class.std::__1::set"*, align 8
  %__k.addr = alloca i32*, align 8
  %agg.tmp = alloca %"class.std::__1::__tree_iterator", align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  store i32* %__k, i32** %__k.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %__tree_ = getelementptr inbounds %"class.std::__1::set", %"class.std::__1::set"* %this1, i32 0, i32 0
  %0 = load i32*, i32** %__k.addr, align 8
  %call = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE4findIiEENS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEERKT_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %__tree_, i32* noundef nonnull align 4 dereferenceable(4) %0)
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.dive2 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp, i32 0, i32 0
  %1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive2, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %1 to i64
  %call3 = call noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC1ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %retval, i64 %coerce.val.pi) #8
  %coerce.dive4 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %retval, i32 0, i32 0
  %2 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive4, align 8
  %coerce.val.pi5 = ptrtoint %"class.std::__1::__tree_end_node"* %2 to i64
  ret i64 %coerce.val.pi5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef i64 @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEE5eraseERKi(%"class.std::__1::set"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__k) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::set"*, align 8
  %__k.addr = alloca i32*, align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  store i32* %__k, i32** %__k.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %__tree_ = getelementptr inbounds %"class.std::__1::set", %"class.std::__1::set"* %this1, i32 0, i32 0
  %0 = load i32*, i32** %__k.addr, align 8
  %call = call noundef i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE14__erase_uniqueIiEEmRKT_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %__tree_, i32* noundef nonnull align 4 dereferenceable(4) %0)
  ret i64 %call
}

declare i32 @"\01_close"(i32 noundef) #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z10run_serverii(i32 noundef %port, i32 noundef %queue_size) #0 {
entry:
  %retval = alloca i32, align 4
  %port.addr = alloca i32, align 4
  %queue_size.addr = alloca i32, align 4
  %sockfd = alloca i32, align 4
  %yesval = alloca i32, align 4
  %addr = alloca %struct.sockaddr_in, align 4
  %connectionfd = alloca i32, align 4
  store i32 %port, i32* %port.addr, align 4
  store i32 %queue_size, i32* %queue_size.addr, align 4
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0)
  store i32 %call, i32* %sockfd, align 4
  %0 = load i32, i32* %sockfd, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i64 0, i64 0)) #17
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %yesval, align 4
  %1 = load i32, i32* %sockfd, align 4
  %2 = bitcast i32* %yesval to i8*
  %call1 = call i32 @setsockopt(i32 noundef %1, i32 noundef 65535, i32 noundef 4, i8* noundef %2, i32 noundef 4)
  %cmp2 = icmp eq i32 %call1, -1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @perror(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.16, i64 0, i64 0)) #17
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load i32, i32* %port.addr, align 4
  %call5 = call noundef i32 @_Z20make_server_sockaddrP11sockaddr_ini(%struct.sockaddr_in* noundef %addr, i32 noundef %3)
  %cmp6 = icmp eq i32 %call5, -1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end4
  %4 = load i32, i32* %sockfd, align 4
  %5 = bitcast %struct.sockaddr_in* %addr to %struct.sockaddr*
  %call9 = call i32 @"\01_bind"(i32 noundef %4, %struct.sockaddr* noundef %5, i32 noundef 16)
  %cmp10 = icmp eq i32 %call9, -1
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @perror(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17, i64 0, i64 0)) #17
  store i32 -1, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end8
  %6 = load i32, i32* %sockfd, align 4
  %call13 = call noundef i32 @_Z15get_port_numberi(i32 noundef %6)
  store i32 %call13, i32* %port.addr, align 4
  %7 = load i32, i32* %port.addr, align 4
  %call14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.18, i64 0, i64 0), i32 noundef %7)
  %8 = load i32, i32* %sockfd, align 4
  %9 = load i32, i32* %queue_size.addr, align 4
  %call15 = call i32 @"\01_listen"(i32 noundef %8, i32 noundef %9)
  br label %while.body

while.body:                                       ; preds = %if.end12, %if.end23
  %10 = load i32, i32* %sockfd, align 4
  %call16 = call i32 @"\01_accept"(i32 noundef %10, %struct.sockaddr* noundef null, i32* noundef null)
  store i32 %call16, i32* %connectionfd, align 4
  %11 = load i32, i32* %connectionfd, align 4
  %cmp17 = icmp eq i32 %11, -1
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %while.body
  call void @perror(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.19, i64 0, i64 0)) #17
  store i32 -1, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %while.body
  %12 = load i32, i32* %connectionfd, align 4
  %call20 = call noundef i32 @_Z17handle_connectioni(i32 noundef %12)
  %cmp21 = icmp eq i32 %call20, -1
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end19
  store i32 -1, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %if.end19
  br label %while.body, !llvm.loop !13

return:                                           ; preds = %if.then22, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, i8* noundef, i32 noundef) #3

declare i32 @"\01_bind"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #3

declare i32 @"\01_listen"(i32 noundef, i32 noundef) #3

declare i32 @"\01_accept"(i32 noundef, %struct.sockaddr* noundef, i32* noundef) #3

; Function Attrs: mustprogress noinline norecurse optnone ssp uwtable
define noundef i32 @main(i32 noundef %argc, i8** noundef %argv) #10 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %port = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp ne i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.20, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  %call1 = call i32 @atoi(i8* noundef %2)
  store i32 %call1, i32* %port, align 4
  %3 = load i32, i32* %port, align 4
  %call2 = call noundef i32 @_Z10run_serverii(i32 noundef %3, i32 noundef 10)
  %cmp3 = icmp eq i32 %call2, -1
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::set"* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEEC2Ev(%"class.std::__1::set"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::set"*, align 8
  %ref.tmp = alloca %"struct.std::__1::less", align 1
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %__tree_ = getelementptr inbounds %"class.std::__1::set", %"class.std::__1::set"* %this1, i32 0, i32 0
  %call = call noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEEC1ERKS2_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %__tree_, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %ref.tmp) #8
  ret %"class.std::__1::set"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEEC1ERKS2_(%"class.std::__1::__tree"* noundef nonnull returned align 8 dereferenceable(24) %this, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %__comp) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__comp.addr = alloca %"struct.std::__1::less"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store %"struct.std::__1::less"* %__comp, %"struct.std::__1::less"** %__comp.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load %"struct.std::__1::less"*, %"struct.std::__1::less"** %__comp.addr, align 8
  %call = call noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEEC2ERKS2_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %0) #8
  ret %"class.std::__1::__tree"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEEC2ERKS2_(%"class.std::__1::__tree"* noundef nonnull returned align 8 dereferenceable(24) %this, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %__comp) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__comp.addr = alloca %"struct.std::__1::less"*, align 8
  %ref.tmp = alloca i32, align 4
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store %"struct.std::__1::less"* %__comp, %"struct.std::__1::less"** %__comp.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %__pair1_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 1
  %call = invoke noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEEC1ILb1EvEEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %__pair1_)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  %__pair3_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 2
  store i32 0, i32* %ref.tmp, align 4
  %0 = load %"struct.std::__1::less"*, %"struct.std::__1::less"** %__comp.addr, align 8
  %call3 = invoke noundef %"class.std::__1::__compressed_pair.1"* @_ZNSt3__117__compressed_pairImNS_4lessIiEEEC1IiRKS2_EEOT_OT0_(%"class.std::__1::__compressed_pair.1"* noundef nonnull align 8 dereferenceable(8) %__pair3_, i32* noundef nonnull align 4 dereferenceable(4) %ref.tmp, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %0)
          to label %invoke.cont2 unwind label %terminate.lpad

invoke.cont2:                                     ; preds = %invoke.cont
  %call4 = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %call5 = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::__tree_end_node"* %call4, %"class.std::__1::__tree_end_node"** %call5, align 8
  ret %"class.std::__1::__tree"* %this1

terminate.lpad:                                   ; preds = %invoke.cont, %entry
  %1 = landingpad { i8*, i32 }
          catch i8* null
  %2 = extractvalue { i8*, i32 } %1, 0
  call void @__clang_call_terminate(i8* %2) #18
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEEC1ILb1EvEEv(%"class.std::__1::__compressed_pair"* noundef nonnull returned align 8 dereferenceable(8) %this) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEEC2ILb1EvEEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %this1)
  ret %"class.std::__1::__compressed_pair"* %this1
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #12 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #8
  call void @_ZSt9terminatev() #18
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair.1"* @_ZNSt3__117__compressed_pairImNS_4lessIiEEEC1IiRKS2_EEOT_OT0_(%"class.std::__1::__compressed_pair.1"* noundef nonnull returned align 8 dereferenceable(8) %this, i32* noundef nonnull align 4 dereferenceable(4) %__t1, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %__t2) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.1"*, align 8
  %__t1.addr = alloca i32*, align 8
  %__t2.addr = alloca %"struct.std::__1::less"*, align 8
  store %"class.std::__1::__compressed_pair.1"* %this, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  store i32* %__t1, i32** %__t1.addr, align 8
  store %"struct.std::__1::less"* %__t2, %"struct.std::__1::less"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.1"*, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  %0 = load i32*, i32** %__t1.addr, align 8
  %1 = load %"struct.std::__1::less"*, %"struct.std::__1::less"** %__t2.addr, align 8
  %call = call noundef %"class.std::__1::__compressed_pair.1"* @_ZNSt3__117__compressed_pairImNS_4lessIiEEEC2IiRKS2_EEOT_OT0_(%"class.std::__1::__compressed_pair.1"* noundef nonnull align 8 dereferenceable(8) %this1, i32* noundef nonnull align 4 dereferenceable(4) %0, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %1)
  ret %"class.std::__1::__compressed_pair.1"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %__pair1_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 1
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %__pair1_) #8
  %call2 = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__114pointer_traitsIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEE10pointer_toERS6_(%"class.std::__1::__tree_end_node"* noundef nonnull align 8 dereferenceable(8) %call) #8
  ret %"class.std::__1::__tree_end_node"* %call2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %__begin_node_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 0
  ret %"class.std::__1::__tree_end_node"** %__begin_node_
}

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEEC2ILb1EvEEv(%"class.std::__1::__compressed_pair"* noundef nonnull returned align 8 dereferenceable(8) %this) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  %agg.tmp = alloca %"struct.std::__1::__value_init_tag", align 1
  %agg.tmp2 = alloca %"struct.std::__1::__value_init_tag", align 1
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %call = call noundef %"struct.std::__1::__compressed_pair_elem"* @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EEC2ENS_16__value_init_tagE(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(8) %0)
  %1 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem.0"*
  %call3 = call noundef %"struct.std::__1::__compressed_pair_elem.0"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeIiPvEEEELi1ELb1EEC2ENS_16__value_init_tagE(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull align 1 dereferenceable(1) %1)
  ret %"class.std::__1::__compressed_pair"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem"* @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EEC2ENS_16__value_init_tagE(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull returned align 8 dereferenceable(8) %this) unnamed_addr #7 align 2 {
entry:
  %0 = alloca %"struct.std::__1::__value_init_tag", align 1
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC1Ev(%"class.std::__1::__tree_end_node"* noundef nonnull align 8 dereferenceable(8) %__value_) #8
  ret %"struct.std::__1::__compressed_pair_elem"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem.0"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeIiPvEEEELi1ELb1EEC2ENS_16__value_init_tagE(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull returned align 1 dereferenceable(1) %this) unnamed_addr #7 align 2 {
entry:
  %0 = alloca %"struct.std::__1::__value_init_tag", align 1
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.0"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.0"* %this, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.0"*, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %1 = bitcast %"struct.std::__1::__compressed_pair_elem.0"* %this1 to %"class.std::__1::allocator"*
  %call = call noundef %"class.std::__1::allocator"* @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEEC2Ev(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %1) #8
  ret %"struct.std::__1::__compressed_pair_elem.0"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC1Ev(%"class.std::__1::__tree_end_node"* noundef nonnull returned align 8 dereferenceable(8) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  store %"class.std::__1::__tree_end_node"* %this, %"class.std::__1::__tree_end_node"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC2Ev(%"class.std::__1::__tree_end_node"* noundef nonnull align 8 dereferenceable(8) %this1) #8
  ret %"class.std::__1::__tree_end_node"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC2Ev(%"class.std::__1::__tree_end_node"* noundef nonnull returned align 8 dereferenceable(8) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  store %"class.std::__1::__tree_end_node"* %this, %"class.std::__1::__tree_end_node"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %this.addr, align 8
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %this1, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* null, %"class.std::__1::__tree_node_base"** %__left_, align 8
  ret %"class.std::__1::__tree_end_node"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::allocator"* @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEEC2Ev(%"class.std::__1::allocator"* noundef nonnull returned align 1 dereferenceable(1) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::allocator"* %this1 to %"struct.std::__1::__non_trivial_if"*
  %call = call noundef %"struct.std::__1::__non_trivial_if"* @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_11__tree_nodeIiPvEEEEEC2Ev(%"struct.std::__1::__non_trivial_if"* noundef nonnull align 1 dereferenceable(1) %0) #8
  ret %"class.std::__1::allocator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__non_trivial_if"* @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_11__tree_nodeIiPvEEEEEC2Ev(%"struct.std::__1::__non_trivial_if"* noundef nonnull returned align 1 dereferenceable(1) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__non_trivial_if"*, align 8
  store %"struct.std::__1::__non_trivial_if"* %this, %"struct.std::__1::__non_trivial_if"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__non_trivial_if"*, %"struct.std::__1::__non_trivial_if"** %this.addr, align 8
  ret %"struct.std::__1::__non_trivial_if"* %this1
}

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair.1"* @_ZNSt3__117__compressed_pairImNS_4lessIiEEEC2IiRKS2_EEOT_OT0_(%"class.std::__1::__compressed_pair.1"* noundef nonnull returned align 8 dereferenceable(8) %this, i32* noundef nonnull align 4 dereferenceable(4) %__t1, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %__t2) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.1"*, align 8
  %__t1.addr = alloca i32*, align 8
  %__t2.addr = alloca %"struct.std::__1::less"*, align 8
  store %"class.std::__1::__compressed_pair.1"* %this, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  store i32* %__t1, i32** %__t1.addr, align 8
  store %"struct.std::__1::less"* %__t2, %"struct.std::__1::less"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.1"*, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair.1"* %this1 to %"struct.std::__1::__compressed_pair_elem.2"*
  %1 = load i32*, i32** %__t1.addr, align 8
  %call = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIiEEOT_RNS_16remove_referenceIS1_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %1) #8
  %call2 = call noundef %"struct.std::__1::__compressed_pair_elem.2"* @_ZNSt3__122__compressed_pair_elemImLi0ELb0EEC2IivEEOT_(%"struct.std::__1::__compressed_pair_elem.2"* noundef nonnull align 8 dereferenceable(8) %0, i32* noundef nonnull align 4 dereferenceable(4) %call)
  %2 = bitcast %"class.std::__1::__compressed_pair.1"* %this1 to %"struct.std::__1::__compressed_pair_elem.3"*
  %3 = load %"struct.std::__1::less"*, %"struct.std::__1::less"** %__t2.addr, align 8
  %call3 = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__1L7forwardIRKNS_4lessIiEEEEOT_RNS_16remove_referenceIS5_E4typeE(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %3) #8
  %call4 = call noundef %"struct.std::__1::__compressed_pair_elem.3"* @_ZNSt3__122__compressed_pair_elemINS_4lessIiEELi1ELb1EEC2IRKS2_vEEOT_(%"struct.std::__1::__compressed_pair_elem.3"* noundef nonnull align 1 dereferenceable(1) %2, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %call3)
  ret %"class.std::__1::__compressed_pair.1"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIiEEOT_RNS_16remove_referenceIS1_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %__t) #2 {
entry:
  %__t.addr = alloca i32*, align 8
  store i32* %__t, i32** %__t.addr, align 8
  %0 = load i32*, i32** %__t.addr, align 8
  ret i32* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem.2"* @_ZNSt3__122__compressed_pair_elemImLi0ELb0EEC2IivEEOT_(%"struct.std::__1::__compressed_pair_elem.2"* noundef nonnull returned align 8 dereferenceable(8) %this, i32* noundef nonnull align 4 dereferenceable(4) %__u) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.2"*, align 8
  %__u.addr = alloca i32*, align 8
  store %"struct.std::__1::__compressed_pair_elem.2"* %this, %"struct.std::__1::__compressed_pair_elem.2"** %this.addr, align 8
  store i32* %__u, i32** %__u.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.2"*, %"struct.std::__1::__compressed_pair_elem.2"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.2", %"struct.std::__1::__compressed_pair_elem.2"* %this1, i32 0, i32 0
  %0 = load i32*, i32** %__u.addr, align 8
  %call = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIiEEOT_RNS_16remove_referenceIS1_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %0) #8
  %1 = load i32, i32* %call, align 4
  %conv = sext i32 %1 to i64
  store i64 %conv, i64* %__value_, align 8
  ret %"struct.std::__1::__compressed_pair_elem.2"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__1L7forwardIRKNS_4lessIiEEEEOT_RNS_16remove_referenceIS5_E4typeE(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %__t) #2 {
entry:
  %__t.addr = alloca %"struct.std::__1::less"*, align 8
  store %"struct.std::__1::less"* %__t, %"struct.std::__1::less"** %__t.addr, align 8
  %0 = load %"struct.std::__1::less"*, %"struct.std::__1::less"** %__t.addr, align 8
  ret %"struct.std::__1::less"* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem.3"* @_ZNSt3__122__compressed_pair_elemINS_4lessIiEELi1ELb1EEC2IRKS2_vEEOT_(%"struct.std::__1::__compressed_pair_elem.3"* noundef nonnull returned align 1 dereferenceable(1) %this, %"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %__u) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.3"*, align 8
  %__u.addr = alloca %"struct.std::__1::less"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.3"* %this, %"struct.std::__1::__compressed_pair_elem.3"** %this.addr, align 8
  store %"struct.std::__1::less"* %__u, %"struct.std::__1::less"** %__u.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.3"*, %"struct.std::__1::__compressed_pair_elem.3"** %this.addr, align 8
  %0 = bitcast %"struct.std::__1::__compressed_pair_elem.3"* %this1 to %"struct.std::__1::less"*
  %1 = load %"struct.std::__1::less"*, %"struct.std::__1::less"** %__u.addr, align 8
  %call = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__1L7forwardIRKNS_4lessIiEEEEOT_RNS_16remove_referenceIS5_E4typeE(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %1) #8
  ret %"struct.std::__1::__compressed_pair_elem.3"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__114pointer_traitsIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEE10pointer_toERS6_(%"class.std::__1::__tree_end_node"* noundef nonnull align 8 dereferenceable(8) %__r) #2 align 2 {
entry:
  %__r.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  store %"class.std::__1::__tree_end_node"* %__r, %"class.std::__1::__tree_end_node"** %__r.addr, align 8
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__r.addr, align 8
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__1L9addressofINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEEEPT_RS7_(%"class.std::__1::__tree_end_node"* noundef nonnull align 8 dereferenceable(8) %0) #8
  ret %"class.std::__1::__tree_end_node"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(8) %0) #8
  ret %"class.std::__1::__tree_end_node"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__1L9addressofINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEEEPT_RS7_(%"class.std::__1::__tree_end_node"* noundef nonnull align 8 dereferenceable(8) %__x) #2 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  store %"class.std::__1::__tree_end_node"* %__x, %"class.std::__1::__tree_end_node"** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__x.addr, align 8
  ret %"class.std::__1::__tree_end_node"* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  ret %"class.std::__1::__tree_end_node"* %__value_
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::set"* @_ZNSt3__13setIiNS_4lessIiEENS_9allocatorIiEEED2Ev(%"class.std::__1::set"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::set"*, align 8
  store %"class.std::__1::set"* %this, %"class.std::__1::set"** %this.addr, align 8
  %this1 = load %"class.std::__1::set"*, %"class.std::__1::set"** %this.addr, align 8
  %__tree_ = getelementptr inbounds %"class.std::__1::set", %"class.std::__1::set"* %this1, i32 0, i32 0
  %call = call noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEED1Ev(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %__tree_) #8
  ret %"class.std::__1::set"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEED1Ev(%"class.std::__1::__tree"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEED2Ev(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  ret %"class.std::__1::__tree"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr noundef %"class.std::__1::__tree"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEED2Ev(%"class.std::__1::__tree"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE6__rootEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  call void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE7destroyEPNS_11__tree_nodeIiPvEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_node"* noundef %call) #8
  ret %"class.std::__1::__tree"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE7destroyEPNS_11__tree_nodeIiPvEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, %"class.std::__1::__tree_node"* noundef %__nd) #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__nd.addr = alloca %"class.std::__1::__tree_node"*, align 8
  %__na = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__nd, %"class.std::__1::__tree_node"** %__nd.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd.addr, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node"* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd.addr, align 8
  %2 = bitcast %"class.std::__1::__tree_node"* %1 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %2, i32 0, i32 0
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %4 = bitcast %"class.std::__1::__tree_node_base"* %3 to %"class.std::__1::__tree_node"*
  call void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE7destroyEPNS_11__tree_nodeIiPvEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_node"* noundef %4) #8
  %5 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd.addr, align 8
  %6 = bitcast %"class.std::__1::__tree_node"* %5 to %"class.std::__1::__tree_node_base"*
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %6, i32 0, i32 1
  %7 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %8 = bitcast %"class.std::__1::__tree_node_base"* %7 to %"class.std::__1::__tree_node"*
  call void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE7destroyEPNS_11__tree_nodeIiPvEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_node"* noundef %8) #8
  %call = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__node_allocEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::allocator"* %call, %"class.std::__1::allocator"** %__na, align 8
  %9 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na, align 8
  %10 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd.addr, align 8
  %__value_ = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %10, i32 0, i32 1
  %call2 = invoke noundef i32* @_ZNSt3__122__tree_key_value_typesIiE9__get_ptrERi(i32* noundef nonnull align 4 dereferenceable(4) %__value_)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %if.then
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE7destroyIivvEEvRS5_PT_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %9, i32* noundef %call2)
          to label %invoke.cont3 unwind label %terminate.lpad

invoke.cont3:                                     ; preds = %invoke.cont
  %11 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na, align 8
  %12 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd.addr, align 8
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE10deallocateERS5_PS4_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %11, %"class.std::__1::__tree_node"* noundef %12, i64 noundef 1) #8
  br label %if.end

if.end:                                           ; preds = %invoke.cont3, %entry
  ret void

terminate.lpad:                                   ; preds = %invoke.cont, %if.then
  %13 = landingpad { i8*, i32 }
          catch i8* null
  %14 = extractvalue { i8*, i32 } %13, 0
  call void @__clang_call_terminate(i8* %14) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE6__rootEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %call, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %1 = bitcast %"class.std::__1::__tree_node_base"* %0 to %"class.std::__1::__tree_node"*
  ret %"class.std::__1::__tree_node"* %1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__node_allocEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %__pair1_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 1
  %call = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEE6secondEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %__pair1_) #8
  ret %"class.std::__1::allocator"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE7destroyIivvEEvRS5_PT_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %0, i32* noundef %__p) #2 align 2 {
entry:
  %.addr = alloca %"class.std::__1::allocator"*, align 8
  %__p.addr = alloca i32*, align 8
  store %"class.std::__1::allocator"* %0, %"class.std::__1::allocator"** %.addr, align 8
  store i32* %__p, i32** %__p.addr, align 8
  %1 = load i32*, i32** %__p.addr, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i32* @_ZNSt3__122__tree_key_value_typesIiE9__get_ptrERi(i32* noundef nonnull align 4 dereferenceable(4) %__n) #2 align 2 {
entry:
  %__n.addr = alloca i32*, align 8
  store i32* %__n, i32** %__n.addr, align 8
  %0 = load i32*, i32** %__n.addr, align 8
  %call = call noundef i32* @_ZNSt3__1L9addressofIiEEPT_RS1_(i32* noundef nonnull align 4 dereferenceable(4) %0) #8
  ret i32* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE10deallocateERS5_PS4_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %__a, %"class.std::__1::__tree_node"* noundef %__p, i64 noundef %__n) #2 align 2 {
entry:
  %__a.addr = alloca %"class.std::__1::allocator"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::__1::allocator"* %__a, %"class.std::__1::allocator"** %__a.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__a.addr, align 8
  %1 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %2 = load i64, i64* %__n.addr, align 8
  call void @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEE10deallocateEPS3_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %0, %"class.std::__1::__tree_node"* noundef %1, i64 noundef %2) #8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEE6secondEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem.0"*
  %call = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeIiPvEEEELi1ELb1EE5__getEv(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull align 1 dereferenceable(1) %0) #8
  ret %"class.std::__1::allocator"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeIiPvEEEELi1ELb1EE5__getEv(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull align 1 dereferenceable(1) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.0"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.0"* %this, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.0"*, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %0 = bitcast %"struct.std::__1::__compressed_pair_elem.0"* %this1 to %"class.std::__1::allocator"*
  ret %"class.std::__1::allocator"* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i32* @_ZNSt3__1L9addressofIiEEPT_RS1_(i32* noundef nonnull align 4 dereferenceable(4) %__x) #2 {
entry:
  %__x.addr = alloca i32*, align 8
  store i32* %__x, i32** %__x.addr, align 8
  %0 = load i32*, i32** %__x.addr, align 8
  ret i32* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEE10deallocateEPS3_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %this, %"class.std::__1::__tree_node"* noundef %__p, i64 noundef %__n) #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_node"* %0 to i8*
  %2 = load i64, i64* %__n.addr, align 8
  %mul = mul i64 %2, 32
  invoke void @_ZNSt3__1L19__libcpp_deallocateEPvmm(i8* noundef %1, i64 noundef %mul, i64 noundef 8)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret void

terminate.lpad:                                   ; preds = %entry
  %3 = landingpad { i8*, i32 }
          catch i8* null
  %4 = extractvalue { i8*, i32 } %3, 0
  call void @__clang_call_terminate(i8* %4) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal void @_ZNSt3__1L19__libcpp_deallocateEPvmm(i8* noundef %__ptr, i64 noundef %__size, i64 noundef %__align) #0 {
entry:
  %__ptr.addr = alloca i8*, align 8
  %__size.addr = alloca i64, align 8
  %__align.addr = alloca i64, align 8
  store i8* %__ptr, i8** %__ptr.addr, align 8
  store i64 %__size, i64* %__size.addr, align 8
  store i64 %__align, i64* %__align.addr, align 8
  %0 = load i8*, i8** %__ptr.addr, align 8
  %1 = load i64, i64* %__size.addr, align 8
  call void @_ZNSt3__1L27__do_deallocate_handle_sizeIJEEEvPvmDpT_(i8* noundef %0, i64 noundef %1)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal void @_ZNSt3__1L27__do_deallocate_handle_sizeIJEEEvPvmDpT_(i8* noundef %__ptr, i64 noundef %__size) #0 {
entry:
  %__ptr.addr = alloca i8*, align 8
  %__size.addr = alloca i64, align 8
  store i8* %__ptr, i8** %__ptr.addr, align 8
  store i64 %__size, i64* %__size.addr, align 8
  %0 = load i8*, i8** %__ptr.addr, align 8
  call void @_ZNSt3__1L24__libcpp_operator_deleteIJPvEEEvDpT_(i8* noundef %0)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__1L24__libcpp_operator_deleteIJPvEEEvDpT_(i8* noundef %__args) #2 {
entry:
  %__args.addr = alloca i8*, align 8
  store i8* %__args, i8** %__args.addr, align 8
  %0 = load i8*, i8** %__args.addr, align 8
  call void @_ZdlPv(i8* noundef %0) #19
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8* noundef) #13

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_end_node"* @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %__pair1_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 1
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNKSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %__pair1_) #8
  %call2 = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__114pointer_traitsIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEE10pointer_toERS6_(%"class.std::__1::__tree_end_node"* noundef nonnull align 8 dereferenceable(8) %call) #8
  ret %"class.std::__1::__tree_end_node"* %call2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNKSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeIiS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNKSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(8) %0) #8
  ret %"class.std::__1::__tree_end_node"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"* @_ZNKSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  ret %"class.std::__1::__tree_end_node"* %__value_
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE5beginEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %call, align 8
  %call2 = call noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC1EPNS_15__tree_end_nodeIPNS_16__tree_node_baseIS2_EEEE(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %retval, %"class.std::__1::__tree_end_node"* noundef %0) #8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %1 to i64
  ret i64 %coerce.val.pi
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC1ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull returned align 8 dereferenceable(8) %this, i64 %__p.coerce) unnamed_addr #7 align 2 {
entry:
  %__p = alloca %"class.std::__1::__tree_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %__p, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %__p.coerce to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  store %"class.std::__1::__tree_const_iterator"* %this, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %coerce.dive2 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %__p, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive2, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %0 to i64
  %call = call noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC2ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %this1, i64 %coerce.val.pi) #8
  ret %"class.std::__1::__tree_const_iterator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC1EPNS_15__tree_end_nodeIPNS_16__tree_node_baseIS2_EEEE(%"class.std::__1::__tree_iterator"* noundef nonnull returned align 8 dereferenceable(8) %this, %"class.std::__1::__tree_end_node"* noundef %__p) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  store %"class.std::__1::__tree_iterator"* %this, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  store %"class.std::__1::__tree_end_node"* %__p, %"class.std::__1::__tree_end_node"** %__p.addr, align 8
  %this1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__p.addr, align 8
  %call = call noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC2EPNS_15__tree_end_nodeIPNS_16__tree_node_baseIS2_EEEE(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %this1, %"class.std::__1::__tree_end_node"* noundef %0) #8
  ret %"class.std::__1::__tree_iterator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC2EPNS_15__tree_end_nodeIPNS_16__tree_node_baseIS2_EEEE(%"class.std::__1::__tree_iterator"* noundef nonnull returned align 8 dereferenceable(8) %this, %"class.std::__1::__tree_end_node"* noundef %__p) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  store %"class.std::__1::__tree_iterator"* %this, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  store %"class.std::__1::__tree_end_node"* %__p, %"class.std::__1::__tree_end_node"** %__p.addr, align 8
  %this1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__p.addr, align 8
  store %"class.std::__1::__tree_end_node"* %0, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  ret %"class.std::__1::__tree_iterator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC2ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull returned align 8 dereferenceable(8) %this, i64 %__p.coerce) unnamed_addr #7 align 2 {
entry:
  %__p = alloca %"class.std::__1::__tree_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %__p, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %__p.coerce to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  store %"class.std::__1::__tree_const_iterator"* %this, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %this1, i32 0, i32 0
  %__ptr_2 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %__p, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_2, align 8
  store %"class.std::__1::__tree_end_node"* %0, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  ret %"class.std::__1::__tree_const_iterator"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %call2 = call noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC1EPNS_15__tree_end_nodeIPNS_16__tree_node_baseIS2_EEEE(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %retval, %"class.std::__1::__tree_end_node"* noundef %call) #8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %0 to i64
  ret i64 %coerce.val.pi
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i1 @_ZNSt3__1eqERKNS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %__x, %"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %__y) #2 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  %__y.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  store %"class.std::__1::__tree_const_iterator"* %__x, %"class.std::__1::__tree_const_iterator"** %__x.addr, align 8
  store %"class.std::__1::__tree_const_iterator"* %__y, %"class.std::__1::__tree_const_iterator"** %__y.addr, align 8
  %0 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %__x.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %0, i32 0, i32 0
  %1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  %2 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %__y.addr, align 8
  %__ptr_1 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %2, i32 0, i32 0
  %3 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_1, align 8
  %cmp = icmp eq %"class.std::__1::__tree_end_node"* %1, %3
  ret i1 %cmp
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEppEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  store %"class.std::__1::__tree_const_iterator"* %this, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  %1 = bitcast %"class.std::__1::__tree_end_node"* %0 to %"class.std::__1::__tree_node_base"*
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__1L16__tree_next_iterIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEES5_EET_T0_(%"class.std::__1::__tree_node_base"* noundef %1) #8
  %__ptr_2 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %this1, i32 0, i32 0
  store %"class.std::__1::__tree_end_node"* %call, %"class.std::__1::__tree_end_node"** %__ptr_2, align 8
  ret %"class.std::__1::__tree_const_iterator"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__1L16__tree_next_iterIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEES5_EET_T0_(%"class.std::__1::__tree_node_base"* noundef %__x) #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %retval = alloca %"class.std::__1::__tree_end_node"*, align 8
  %__x.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %__x, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %0, i32 0, i32 1
  %1 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node_base"* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_1 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %2, i32 0, i32 1
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_1, align 8
  %call = call noundef %"class.std::__1::__tree_node_base"* @_ZNSt3__1L10__tree_minIPNS_16__tree_node_baseIPvEEEET_S5_(%"class.std::__1::__tree_node_base"* noundef %3) #8
  %4 = bitcast %"class.std::__1::__tree_node_base"* %call to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %4, %"class.std::__1::__tree_end_node"** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %invoke.cont, %if.end
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call2 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %5) #8
  %lnot = xor i1 %call2, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call3 = invoke noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %6)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %while.body
  store %"class.std::__1::__tree_node_base"* %call3, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  br label %while.cond, !llvm.loop !14

while.end:                                        ; preds = %while.cond
  %7 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %7, i32 0, i32 2
  %8 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  store %"class.std::__1::__tree_end_node"* %8, %"class.std::__1::__tree_end_node"** %retval, align 8
  br label %return

return:                                           ; preds = %while.end, %if.then
  %9 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %retval, align 8
  ret %"class.std::__1::__tree_end_node"* %9

terminate.lpad:                                   ; preds = %while.body
  %10 = landingpad { i8*, i32 }
          catch i8* null
  %11 = extractvalue { i8*, i32 } %10, 0
  call void @__clang_call_terminate(i8* %11) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node_base"* @_ZNSt3__1L10__tree_minIPNS_16__tree_node_baseIPvEEEET_S5_(%"class.std::__1::__tree_node_base"* noundef %__x) #2 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %__x, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_node_base"* %0 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %1, i32 0, i32 0
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node_base"* %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %4 = bitcast %"class.std::__1::__tree_node_base"* %3 to %"class.std::__1::__tree_end_node"*
  %__left_1 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %4, i32 0, i32 0
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_1, align 8
  store %"class.std::__1::__tree_node_base"* %5, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  br label %while.cond, !llvm.loop !15

while.end:                                        ; preds = %while.cond
  %6 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  ret %"class.std::__1::__tree_node_base"* %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %__x) #2 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %__x, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %1 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %1, i32 0, i32 2
  %2 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %2, i32 0, i32 0
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %cmp = icmp eq %"class.std::__1::__tree_node_base"* %0, %3
  ret i1 %cmp
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %this, %"class.std::__1::__tree_node_base"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %this.addr, align 8
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %this1, i32 0, i32 2
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  %1 = bitcast %"class.std::__1::__tree_end_node"* %0 to %"class.std::__1::__tree_node_base"*
  ret %"class.std::__1::__tree_node_base"* %1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNKSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElE8__get_npEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_const_iterator"*, align 8
  store %"class.std::__1::__tree_const_iterator"* %this, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_const_iterator"*, %"class.std::__1::__tree_const_iterator"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  %1 = bitcast %"class.std::__1::__tree_end_node"* %0 to %"class.std::__1::__tree_node"*
  ret %"class.std::__1::__tree_node"* %1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal [2 x i64] @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE15__insert_uniqueERKi(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__v) #0 align 2 {
entry:
  %retval = alloca %"struct.std::__1::pair.4", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__v.addr = alloca i32*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store i32* %__v, i32** %__v.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load i32*, i32** %__v.addr, align 8
  %call = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__122__tree_key_value_typesIiE9__get_keyERKi(i32* noundef nonnull align 4 dereferenceable(4) %0)
  %1 = load i32*, i32** %__v.addr, align 8
  %call2 = call [2 x i64] @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE25__emplace_unique_key_argsIiJRKiEEENS_4pairINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEbEERKT_DpOT0_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, i32* noundef nonnull align 4 dereferenceable(4) %call, i32* noundef nonnull align 4 dereferenceable(4) %1)
  %2 = bitcast %"struct.std::__1::pair.4"* %retval to [2 x i64]*
  store [2 x i64] %call2, [2 x i64]* %2, align 8
  %3 = bitcast %"struct.std::__1::pair.4"* %retval to [2 x i64]*
  %4 = load [2 x i64], [2 x i64]* %3, align 8
  ret [2 x i64] %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::pair"* @_ZNSt3__14pairINS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC1INS_15__tree_iteratorIiS5_lEEbLb0EEEONS0_IT_T0_EE(%"struct.std::__1::pair"* noundef nonnull returned align 8 dereferenceable(9) %this, %"struct.std::__1::pair.4"* noundef nonnull align 8 dereferenceable(9) %__p) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::pair"*, align 8
  %__p.addr = alloca %"struct.std::__1::pair.4"*, align 8
  store %"struct.std::__1::pair"* %this, %"struct.std::__1::pair"** %this.addr, align 8
  store %"struct.std::__1::pair.4"* %__p, %"struct.std::__1::pair.4"** %__p.addr, align 8
  %this1 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %this.addr, align 8
  %0 = load %"struct.std::__1::pair.4"*, %"struct.std::__1::pair.4"** %__p.addr, align 8
  %call = call noundef %"struct.std::__1::pair"* @_ZNSt3__14pairINS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC2INS_15__tree_iteratorIiS5_lEEbLb0EEEONS0_IT_T0_EE(%"struct.std::__1::pair"* noundef nonnull align 8 dereferenceable(9) %this1, %"struct.std::__1::pair.4"* noundef nonnull align 8 dereferenceable(9) %0) #8
  ret %"struct.std::__1::pair"* %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define linkonce_odr [2 x i64] @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE25__emplace_unique_key_argsIiJRKiEEENS_4pairINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEbEERKT_DpOT0_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__k, i32* noundef nonnull align 4 dereferenceable(4) %__args) #0 align 2 {
entry:
  %retval = alloca %"struct.std::__1::pair.4", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__k.addr = alloca i32*, align 8
  %__args.addr = alloca i32*, align 8
  %__parent = alloca %"class.std::__1::__tree_end_node"*, align 8
  %__child = alloca %"class.std::__1::__tree_node_base"**, align 8
  %__r = alloca %"class.std::__1::__tree_node"*, align 8
  %__inserted = alloca i8, align 1
  %__h = alloca %"class.std::__1::unique_ptr", align 8
  %ref.tmp = alloca %"class.std::__1::__tree_iterator", align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store i32* %__k, i32** %__k.addr, align 8
  store i32* %__args, i32** %__args.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load i32*, i32** %__k.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node_base"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__find_equalIiEERPNS_16__tree_node_baseIPvEERPNS_15__tree_end_nodeISA_EERKT_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_end_node"** noundef nonnull align 8 dereferenceable(8) %__parent, i32* noundef nonnull align 4 dereferenceable(4) %0)
  store %"class.std::__1::__tree_node_base"** %call, %"class.std::__1::__tree_node_base"*** %__child, align 8
  %1 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %__child, align 8
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %1, align 8
  %3 = bitcast %"class.std::__1::__tree_node_base"* %2 to %"class.std::__1::__tree_node"*
  store %"class.std::__1::__tree_node"* %3, %"class.std::__1::__tree_node"** %__r, align 8
  store i8 0, i8* %__inserted, align 1
  %4 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %__child, align 8
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %4, align 8
  %cmp = icmp eq %"class.std::__1::__tree_node_base"* %5, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i32*, i32** %__args.addr, align 8
  %call2 = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIRKiEEOT_RNS_16remove_referenceIS3_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %6) #8
  call void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE16__construct_nodeIJRKiEEENS_10unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS3_ISC_EEEEEEDpOT_(%"class.std::__1::unique_ptr"* sret(%"class.std::__1::unique_ptr") align 8 %__h, %"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, i32* noundef nonnull align 4 dereferenceable(4) %call2)
  %7 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent, align 8
  %8 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %__child, align 8
  %call3 = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE3getEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %__h) #8
  %9 = bitcast %"class.std::__1::__tree_node"* %call3 to %"class.std::__1::__tree_node_base"*
  call void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE16__insert_node_atEPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEERSA_SA_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_end_node"* noundef %7, %"class.std::__1::__tree_node_base"** noundef nonnull align 8 dereferenceable(8) %8, %"class.std::__1::__tree_node_base"* noundef %9) #8
  %call4 = call noundef %"class.std::__1::__tree_node"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE7releaseEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %__h) #8
  store %"class.std::__1::__tree_node"* %call4, %"class.std::__1::__tree_node"** %__r, align 8
  store i8 1, i8* %__inserted, align 1
  %call5 = call noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEED1Ev(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %__h) #8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__r, align 8
  %call6 = call noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC1ES4_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %ref.tmp, %"class.std::__1::__tree_node"* noundef %10) #8
  %call7 = call noundef %"struct.std::__1::pair.4"* @_ZNSt3__14pairINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC1IS6_RbLb0EEEOT_OT0_(%"struct.std::__1::pair.4"* noundef nonnull align 8 dereferenceable(9) %retval, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %ref.tmp, i8* noundef nonnull align 1 dereferenceable(1) %__inserted) #8
  %11 = bitcast %"struct.std::__1::pair.4"* %retval to [2 x i64]*
  %12 = load [2 x i64], [2 x i64]* %11, align 8
  ret [2 x i64] %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__122__tree_key_value_typesIiE9__get_keyERKi(i32* noundef nonnull align 4 dereferenceable(4) %__v) #2 align 2 {
entry:
  %__v.addr = alloca i32*, align 8
  store i32* %__v, i32** %__v.addr, align 8
  %0 = load i32*, i32** %__v.addr, align 8
  ret i32* %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define linkonce_odr noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node_base"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__find_equalIiEERPNS_16__tree_node_baseIPvEERPNS_15__tree_end_nodeISA_EERKT_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, %"class.std::__1::__tree_end_node"** noundef nonnull align 8 dereferenceable(8) %__parent, i32* noundef nonnull align 4 dereferenceable(4) %__v) #0 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_node_base"**, align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__parent.addr = alloca %"class.std::__1::__tree_end_node"**, align 8
  %__v.addr = alloca i32*, align 8
  %__nd = alloca %"class.std::__1::__tree_node"*, align 8
  %__nd_ptr = alloca %"class.std::__1::__tree_node_base"**, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store %"class.std::__1::__tree_end_node"** %__parent, %"class.std::__1::__tree_end_node"*** %__parent.addr, align 8
  store i32* %__v, i32** %__v.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE6__rootEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::__tree_node"* %call, %"class.std::__1::__tree_node"** %__nd, align 8
  %call2 = call noundef %"class.std::__1::__tree_node_base"** @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__root_ptrEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::__tree_node_base"** %call2, %"class.std::__1::__tree_node_base"*** %__nd_ptr, align 8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node"* %0, null
  br i1 %cmp, label %if.then, label %if.end28

if.then:                                          ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %if.then, %if.end27
  %call3 = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10value_compEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %1 = load i32*, i32** %__v.addr, align 8
  %2 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %__value_ = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %2, i32 0, i32 1
  %call4 = call noundef zeroext i1 @_ZNKSt3__14lessIiEclERKiS3_(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %call3, i32* noundef nonnull align 4 dereferenceable(4) %1, i32* noundef nonnull align 4 dereferenceable(4) %__value_)
  br i1 %call4, label %if.then5, label %if.else12

if.then5:                                         ; preds = %while.body
  %3 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %4 = bitcast %"class.std::__1::__tree_node"* %3 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %4, i32 0, i32 0
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %cmp6 = icmp ne %"class.std::__1::__tree_node_base"* %5, null
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then5
  %6 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %7 = bitcast %"class.std::__1::__tree_node"* %6 to %"class.std::__1::__tree_end_node"*
  %__left_8 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %7, i32 0, i32 0
  %call9 = call noundef %"class.std::__1::__tree_node_base"** @_ZNSt3__1L9addressofIPNS_16__tree_node_baseIPvEEEEPT_RS5_(%"class.std::__1::__tree_node_base"** noundef nonnull align 8 dereferenceable(8) %__left_8) #8
  store %"class.std::__1::__tree_node_base"** %call9, %"class.std::__1::__tree_node_base"*** %__nd_ptr, align 8
  %8 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %9 = bitcast %"class.std::__1::__tree_node"* %8 to %"class.std::__1::__tree_end_node"*
  %__left_10 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %9, i32 0, i32 0
  %10 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_10, align 8
  %11 = bitcast %"class.std::__1::__tree_node_base"* %10 to %"class.std::__1::__tree_node"*
  store %"class.std::__1::__tree_node"* %11, %"class.std::__1::__tree_node"** %__nd, align 8
  br label %if.end

if.else:                                          ; preds = %if.then5
  %12 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %13 = bitcast %"class.std::__1::__tree_node"* %12 to %"class.std::__1::__tree_end_node"*
  %14 = load %"class.std::__1::__tree_end_node"**, %"class.std::__1::__tree_end_node"*** %__parent.addr, align 8
  store %"class.std::__1::__tree_end_node"* %13, %"class.std::__1::__tree_end_node"** %14, align 8
  %15 = load %"class.std::__1::__tree_end_node"**, %"class.std::__1::__tree_end_node"*** %__parent.addr, align 8
  %16 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %15, align 8
  %__left_11 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %16, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"** %__left_11, %"class.std::__1::__tree_node_base"*** %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then7
  br label %if.end27

if.else12:                                        ; preds = %while.body
  %call13 = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10value_compEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %17 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %__value_14 = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %17, i32 0, i32 1
  %18 = load i32*, i32** %__v.addr, align 8
  %call15 = call noundef zeroext i1 @_ZNKSt3__14lessIiEclERKiS3_(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %call13, i32* noundef nonnull align 4 dereferenceable(4) %__value_14, i32* noundef nonnull align 4 dereferenceable(4) %18)
  br i1 %call15, label %if.then16, label %if.else25

if.then16:                                        ; preds = %if.else12
  %19 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %20 = bitcast %"class.std::__1::__tree_node"* %19 to %"class.std::__1::__tree_node_base"*
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %20, i32 0, i32 1
  %21 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %cmp17 = icmp ne %"class.std::__1::__tree_node_base"* %21, null
  br i1 %cmp17, label %if.then18, label %if.else22

if.then18:                                        ; preds = %if.then16
  %22 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %23 = bitcast %"class.std::__1::__tree_node"* %22 to %"class.std::__1::__tree_node_base"*
  %__right_19 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %23, i32 0, i32 1
  %call20 = call noundef %"class.std::__1::__tree_node_base"** @_ZNSt3__1L9addressofIPNS_16__tree_node_baseIPvEEEEPT_RS5_(%"class.std::__1::__tree_node_base"** noundef nonnull align 8 dereferenceable(8) %__right_19) #8
  store %"class.std::__1::__tree_node_base"** %call20, %"class.std::__1::__tree_node_base"*** %__nd_ptr, align 8
  %24 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %25 = bitcast %"class.std::__1::__tree_node"* %24 to %"class.std::__1::__tree_node_base"*
  %__right_21 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %25, i32 0, i32 1
  %26 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_21, align 8
  %27 = bitcast %"class.std::__1::__tree_node_base"* %26 to %"class.std::__1::__tree_node"*
  store %"class.std::__1::__tree_node"* %27, %"class.std::__1::__tree_node"** %__nd, align 8
  br label %if.end24

if.else22:                                        ; preds = %if.then16
  %28 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %29 = bitcast %"class.std::__1::__tree_node"* %28 to %"class.std::__1::__tree_end_node"*
  %30 = load %"class.std::__1::__tree_end_node"**, %"class.std::__1::__tree_end_node"*** %__parent.addr, align 8
  store %"class.std::__1::__tree_end_node"* %29, %"class.std::__1::__tree_end_node"** %30, align 8
  %31 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %32 = bitcast %"class.std::__1::__tree_node"* %31 to %"class.std::__1::__tree_node_base"*
  %__right_23 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %32, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"** %__right_23, %"class.std::__1::__tree_node_base"*** %retval, align 8
  br label %return

if.end24:                                         ; preds = %if.then18
  br label %if.end26

if.else25:                                        ; preds = %if.else12
  %33 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__nd, align 8
  %34 = bitcast %"class.std::__1::__tree_node"* %33 to %"class.std::__1::__tree_end_node"*
  %35 = load %"class.std::__1::__tree_end_node"**, %"class.std::__1::__tree_end_node"*** %__parent.addr, align 8
  store %"class.std::__1::__tree_end_node"* %34, %"class.std::__1::__tree_end_node"** %35, align 8
  %36 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %__nd_ptr, align 8
  store %"class.std::__1::__tree_node_base"** %36, %"class.std::__1::__tree_node_base"*** %retval, align 8
  br label %return

if.end26:                                         ; preds = %if.end24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end
  br label %while.body, !llvm.loop !16

if.end28:                                         ; preds = %entry
  %call29 = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %37 = load %"class.std::__1::__tree_end_node"**, %"class.std::__1::__tree_end_node"*** %__parent.addr, align 8
  store %"class.std::__1::__tree_end_node"* %call29, %"class.std::__1::__tree_end_node"** %37, align 8
  %38 = load %"class.std::__1::__tree_end_node"**, %"class.std::__1::__tree_end_node"*** %__parent.addr, align 8
  %39 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %38, align 8
  %__left_30 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %39, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"** %__left_30, %"class.std::__1::__tree_node_base"*** %retval, align 8
  br label %return

return:                                           ; preds = %if.end28, %if.else25, %if.else22, %if.else
  %40 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %retval, align 8
  ret %"class.std::__1::__tree_node_base"** %40
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define linkonce_odr void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE16__construct_nodeIJRKiEEENS_10unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS3_ISC_EEEEEEDpOT_(%"class.std::__1::unique_ptr"* noalias sret(%"class.std::__1::unique_ptr") align 8 %agg.result, %"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__args) #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %result.ptr = alloca i8*, align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__args.addr = alloca i32*, align 8
  %__na = alloca %"class.std::__1::allocator"*, align 8
  %nrvo = alloca i1, align 1
  %ref.tmp = alloca %"class.std::__1::__tree_node_destructor", align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  %0 = bitcast %"class.std::__1::unique_ptr"* %agg.result to i8*
  store i8* %0, i8** %result.ptr, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store i32* %__args, i32** %__args.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__node_allocEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::allocator"* %call, %"class.std::__1::allocator"** %__na, align 8
  store i1 false, i1* %nrvo, align 1
  %1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na, align 8
  %call2 = call noundef %"class.std::__1::__tree_node"* @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE8allocateERS5_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %1, i64 noundef 1)
  %2 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na, align 8
  %call3 = call noundef %"class.std::__1::__tree_node_destructor"* @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEC1ERS5_b(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %ref.tmp, %"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %2, i1 noundef zeroext false) #8
  %call4 = call noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC1ILb1EvEEPS3_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeIS7_EEXT_EE20__good_rval_ref_typeE(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %agg.result, %"class.std::__1::__tree_node"* noundef %call2, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %ref.tmp) #8
  %3 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na, align 8
  %call5 = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEptEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %agg.result) #8
  %__value_ = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %call5, i32 0, i32 1
  %call6 = call noundef i32* @_ZNSt3__122__tree_key_value_typesIiE9__get_ptrERi(i32* noundef nonnull align 4 dereferenceable(4) %__value_)
  %4 = load i32*, i32** %__args.addr, align 8
  %call7 = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIRKiEEOT_RNS_16remove_referenceIS3_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %4) #8
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE9constructIiJRKiEvEEvRS5_PT_DpOT0_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %3, i32* noundef %call6, i32* noundef nonnull align 4 dereferenceable(4) %call7)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call8 = call noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE11get_deleterEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %agg.result) #8
  %__value_constructed = getelementptr inbounds %"class.std::__1::__tree_node_destructor", %"class.std::__1::__tree_node_destructor"* %call8, i32 0, i32 1
  store i8 1, i8* %__value_constructed, align 8
  store i1 true, i1* %nrvo, align 1
  %nrvo.val = load i1, i1* %nrvo, align 1
  br i1 %nrvo.val, label %nrvo.skipdtor, label %nrvo.unused

lpad:                                             ; preds = %entry
  %5 = landingpad { i8*, i32 }
          cleanup
  %6 = extractvalue { i8*, i32 } %5, 0
  store i8* %6, i8** %exn.slot, align 8
  %7 = extractvalue { i8*, i32 } %5, 1
  store i32 %7, i32* %ehselector.slot, align 4
  %call10 = call noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEED1Ev(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %agg.result) #8
  br label %eh.resume

nrvo.unused:                                      ; preds = %invoke.cont
  %call9 = call noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEED1Ev(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %agg.result) #8
  br label %nrvo.skipdtor

nrvo.skipdtor:                                    ; preds = %nrvo.unused, %invoke.cont
  ret void

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val11 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIRKiEEOT_RNS_16remove_referenceIS3_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %__t) #2 {
entry:
  %__t.addr = alloca i32*, align 8
  store i32* %__t, i32** %__t.addr, align 8
  %0 = load i32*, i32** %__t.addr, align 8
  ret i32* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE16__insert_node_atEPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEERSA_SA_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, %"class.std::__1::__tree_end_node"* noundef %__parent, %"class.std::__1::__tree_node_base"** noundef nonnull align 8 dereferenceable(8) %__child, %"class.std::__1::__tree_node_base"* noundef %__new_node) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__parent.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  %__child.addr = alloca %"class.std::__1::__tree_node_base"**, align 8
  %__new_node.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store %"class.std::__1::__tree_end_node"* %__parent, %"class.std::__1::__tree_end_node"** %__parent.addr, align 8
  store %"class.std::__1::__tree_node_base"** %__child, %"class.std::__1::__tree_node_base"*** %__child.addr, align 8
  store %"class.std::__1::__tree_node_base"* %__new_node, %"class.std::__1::__tree_node_base"** %__new_node.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__new_node.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_node_base"* %0 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %1, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* null, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__new_node.addr, align 8
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %2, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* null, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %3 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent.addr, align 8
  %4 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__new_node.addr, align 8
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %4, i32 0, i32 2
  store %"class.std::__1::__tree_end_node"* %3, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__new_node.addr, align 8
  %6 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %__child.addr, align 8
  store %"class.std::__1::__tree_node_base"* %5, %"class.std::__1::__tree_node_base"** %6, align 8
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %7 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %call, align 8
  %__left_2 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %7, i32 0, i32 0
  %8 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_2, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node_base"* %8, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %9 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %call3, align 8
  %__left_4 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %9, i32 0, i32 0
  %10 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_4, align 8
  %11 = bitcast %"class.std::__1::__tree_node_base"* %10 to %"class.std::__1::__tree_end_node"*
  %call5 = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::__tree_end_node"* %11, %"class.std::__1::__tree_end_node"** %call5, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call6 = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %__left_7 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %call6, i32 0, i32 0
  %12 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_7, align 8
  %13 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %__child.addr, align 8
  %14 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %13, align 8
  call void @_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_(%"class.std::__1::__tree_node_base"* noundef %12, %"class.std::__1::__tree_node_base"* noundef %14) #8
  %call8 = call noundef nonnull align 8 dereferenceable(8) i64* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE4sizeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %15 = load i64, i64* %call8, align 8
  %inc = add i64 %15, 1
  store i64 %inc, i64* %call8, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNKSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE3getEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNKSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_) #8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %call, align 8
  ret %"class.std::__1::__tree_node"* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE7releaseEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  %__t = alloca %"class.std::__1::__tree_node"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_) #8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %call, align 8
  store %"class.std::__1::__tree_node"* %0, %"class.std::__1::__tree_node"** %__t, align 8
  %__ptr_2 = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call3 = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_2) #8
  store %"class.std::__1::__tree_node"* null, %"class.std::__1::__tree_node"** %call3, align 8
  %1 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__t, align 8
  ret %"class.std::__1::__tree_node"* %1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEED1Ev(%"class.std::__1::unique_ptr"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %call = call noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEED2Ev(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  ret %"class.std::__1::unique_ptr"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC1ES4_(%"class.std::__1::__tree_iterator"* noundef nonnull returned align 8 dereferenceable(8) %this, %"class.std::__1::__tree_node"* noundef %__p) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  store %"class.std::__1::__tree_iterator"* %this, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %call = call noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC2ES4_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %this1, %"class.std::__1::__tree_node"* noundef %0) #8
  ret %"class.std::__1::__tree_iterator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::pair.4"* @_ZNSt3__14pairINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC1IS6_RbLb0EEEOT_OT0_(%"struct.std::__1::pair.4"* noundef nonnull returned align 8 dereferenceable(9) %this, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__u1, i8* noundef nonnull align 1 dereferenceable(1) %__u2) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::pair.4"*, align 8
  %__u1.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__u2.addr = alloca i8*, align 8
  store %"struct.std::__1::pair.4"* %this, %"struct.std::__1::pair.4"** %this.addr, align 8
  store %"class.std::__1::__tree_iterator"* %__u1, %"class.std::__1::__tree_iterator"** %__u1.addr, align 8
  store i8* %__u2, i8** %__u2.addr, align 8
  %this1 = load %"struct.std::__1::pair.4"*, %"struct.std::__1::pair.4"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %__u1.addr, align 8
  %1 = load i8*, i8** %__u2.addr, align 8
  %call = call noundef %"struct.std::__1::pair.4"* @_ZNSt3__14pairINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC2IS6_RbLb0EEEOT_OT0_(%"struct.std::__1::pair.4"* noundef nonnull align 8 dereferenceable(9) %this1, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %0, i8* noundef nonnull align 1 dereferenceable(1) %1) #8
  ret %"struct.std::__1::pair.4"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr noundef %"class.std::__1::__tree_node_base"** @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__root_ptrEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %call, i32 0, i32 0
  %call2 = call noundef %"class.std::__1::__tree_node_base"** @_ZNSt3__1L9addressofIPNS_16__tree_node_baseIPvEEEEPT_RS5_(%"class.std::__1::__tree_node_base"** noundef nonnull align 8 dereferenceable(8) %__left_) #8
  ret %"class.std::__1::__tree_node_base"** %call2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10value_compEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %__pair3_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 2
  %call = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__117__compressed_pairImNS_4lessIiEEE6secondEv(%"class.std::__1::__compressed_pair.1"* noundef nonnull align 8 dereferenceable(8) %__pair3_) #8
  ret %"struct.std::__1::less"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i1 @_ZNKSt3__14lessIiEclERKiS3_(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %this, i32* noundef nonnull align 4 dereferenceable(4) %__x, i32* noundef nonnull align 4 dereferenceable(4) %__y) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::less"*, align 8
  %__x.addr = alloca i32*, align 8
  %__y.addr = alloca i32*, align 8
  store %"struct.std::__1::less"* %this, %"struct.std::__1::less"** %this.addr, align 8
  store i32* %__x, i32** %__x.addr, align 8
  store i32* %__y, i32** %__y.addr, align 8
  %this1 = load %"struct.std::__1::less"*, %"struct.std::__1::less"** %this.addr, align 8
  %0 = load i32*, i32** %__x.addr, align 8
  %1 = load i32, i32* %0, align 4
  %2 = load i32*, i32** %__y.addr, align 8
  %3 = load i32, i32* %2, align 4
  %cmp = icmp slt i32 %1, %3
  ret i1 %cmp
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node_base"** @_ZNSt3__1L9addressofIPNS_16__tree_node_baseIPvEEEEPT_RS5_(%"class.std::__1::__tree_node_base"** noundef nonnull align 8 dereferenceable(8) %__x) #2 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_node_base"**, align 8
  store %"class.std::__1::__tree_node_base"** %__x, %"class.std::__1::__tree_node_base"*** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"**, %"class.std::__1::__tree_node_base"*** %__x.addr, align 8
  ret %"class.std::__1::__tree_node_base"** %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__117__compressed_pairImNS_4lessIiEEE6secondEv(%"class.std::__1::__compressed_pair.1"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.1"*, align 8
  store %"class.std::__1::__compressed_pair.1"* %this, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.1"*, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair.1"* %this1 to %"struct.std::__1::__compressed_pair_elem.3"*
  %call = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__122__compressed_pair_elemINS_4lessIiEELi1ELb1EE5__getEv(%"struct.std::__1::__compressed_pair_elem.3"* noundef nonnull align 1 dereferenceable(1) %0) #8
  ret %"struct.std::__1::less"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__122__compressed_pair_elemINS_4lessIiEELi1ELb1EE5__getEv(%"struct.std::__1::__compressed_pair_elem.3"* noundef nonnull align 1 dereferenceable(1) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.3"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.3"* %this, %"struct.std::__1::__compressed_pair_elem.3"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.3"*, %"struct.std::__1::__compressed_pair_elem.3"** %this.addr, align 8
  %0 = bitcast %"struct.std::__1::__compressed_pair_elem.3"* %this1 to %"struct.std::__1::less"*
  ret %"struct.std::__1::less"* %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE8allocateERS5_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %__a, i64 noundef %__n) #0 align 2 {
entry:
  %__a.addr = alloca %"class.std::__1::allocator"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::__1::allocator"* %__a, %"class.std::__1::allocator"** %__a.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %0 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__a.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node"* @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEE8allocateEm(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1)
  ret %"class.std::__1::__tree_node"* %call
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node_destructor"* @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEC1ERS5_b(%"class.std::__1::__tree_node_destructor"* noundef nonnull returned align 8 dereferenceable(9) %this, %"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %__na, i1 noundef zeroext %__val) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  %__na.addr = alloca %"class.std::__1::allocator"*, align 8
  %__val.addr = alloca i8, align 1
  store %"class.std::__1::__tree_node_destructor"* %this, %"class.std::__1::__tree_node_destructor"** %this.addr, align 8
  store %"class.std::__1::allocator"* %__na, %"class.std::__1::allocator"** %__na.addr, align 8
  %frombool = zext i1 %__val to i8
  store i8 %frombool, i8* %__val.addr, align 1
  %this1 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %this.addr, align 8
  %0 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na.addr, align 8
  %1 = load i8, i8* %__val.addr, align 1
  %tobool = trunc i8 %1 to i1
  %call = call noundef %"class.std::__1::__tree_node_destructor"* @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEC2ERS5_b(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %this1, %"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %0, i1 noundef zeroext %tobool) #8
  ret %"class.std::__1::__tree_node_destructor"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC1ILb1EvEEPS3_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeIS7_EEXT_EE20__good_rval_ref_typeE(%"class.std::__1::unique_ptr"* noundef nonnull returned align 8 dereferenceable(24) %this, %"class.std::__1::__tree_node"* noundef %__p, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %__d) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  %__d.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  store %"class.std::__1::__tree_node_destructor"* %__d, %"class.std::__1::__tree_node_destructor"** %__d.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %1 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %__d.addr, align 8
  %call = call noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC2ILb1EvEEPS3_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeIS7_EEXT_EE20__good_rval_ref_typeE(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_node"* noundef %0, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %1) #8
  ret %"class.std::__1::unique_ptr"* %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE9constructIiJRKiEvEEvRS5_PT_DpOT0_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %__a, i32* noundef %__p, i32* noundef nonnull align 4 dereferenceable(4) %__args) #0 align 2 {
entry:
  %__a.addr = alloca %"class.std::__1::allocator"*, align 8
  %__p.addr = alloca i32*, align 8
  %__args.addr = alloca i32*, align 8
  store %"class.std::__1::allocator"* %__a, %"class.std::__1::allocator"** %__a.addr, align 8
  store i32* %__p, i32** %__p.addr, align 8
  store i32* %__args, i32** %__args.addr, align 8
  %0 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__a.addr, align 8
  %1 = load i32*, i32** %__p.addr, align 8
  %2 = load i32*, i32** %__args.addr, align 8
  %call = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIRKiEEOT_RNS_16remove_referenceIS3_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %2) #8
  call void @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEE9constructIiJRKiEEEvPT_DpOT0_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %0, i32* noundef %1, i32* noundef nonnull align 4 dereferenceable(4) %call)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNKSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEptEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNKSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_) #8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %call, align 8
  ret %"class.std::__1::__tree_node"* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE11get_deleterEv(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE6secondEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_) #8
  ret %"class.std::__1::__tree_node_destructor"* %call
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEE8allocateEm(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %this, i64 noundef %__n) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  store i64 %__n, i64* %__n.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  %0 = load i64, i64* %__n.addr, align 8
  %call = call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE8max_sizeIS5_vEEmRKS5_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %this1) #8
  %cmp = icmp ugt i64 %0, %call
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_ZNSt3__1L20__throw_length_errorEPKc(i8* noundef getelementptr inbounds ([68 x i8], [68 x i8]* @.str.21, i64 0, i64 0)) #20
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %__n.addr, align 8
  %mul = mul i64 %1, 32
  %call2 = call noundef i8* @_ZNSt3__1L17__libcpp_allocateEmm(i64 noundef %mul, i64 noundef 8)
  %2 = bitcast i8* %call2 to %"class.std::__1::__tree_node"*
  ret %"class.std::__1::__tree_node"* %2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE8max_sizeIS5_vEEmRKS5_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %__a) #2 align 2 {
entry:
  %__a.addr = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::allocator"* %__a, %"class.std::__1::allocator"** %__a.addr, align 8
  %0 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__a.addr, align 8
  %call = call noundef i64 @_ZNKSt3__19allocatorINS_11__tree_nodeIiPvEEE8max_sizeEv(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %0) #8
  ret i64 %call
}

; Function Attrs: mustprogress noinline noreturn optnone ssp uwtable
define internal void @_ZNSt3__1L20__throw_length_errorEPKc(i8* noundef %__msg) #14 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__msg.addr = alloca i8*, align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  store i8* %__msg, i8** %__msg.addr, align 8
  %exception = call i8* @__cxa_allocate_exception(i64 16) #8
  %0 = bitcast i8* %exception to %"class.std::length_error"*
  %1 = load i8*, i8** %__msg.addr, align 8
  %call = invoke noundef %"class.std::length_error"* @_ZNSt12length_errorC1EPKc(%"class.std::length_error"* noundef nonnull align 8 dereferenceable(16) %0, i8* noundef %1)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  call void @__cxa_throw(i8* %exception, i8* bitcast (i8** @_ZTISt12length_error to i8*), i8* bitcast (%"class.std::length_error"* (%"class.std::length_error"*)* @_ZNSt12length_errorD1Ev to i8*)) #20
  unreachable

lpad:                                             ; preds = %entry
  %2 = landingpad { i8*, i32 }
          cleanup
  %3 = extractvalue { i8*, i32 } %2, 0
  store i8* %3, i8** %exn.slot, align 8
  %4 = extractvalue { i8*, i32 } %2, 1
  store i32 %4, i32* %ehselector.slot, align 4
  call void @__cxa_free_exception(i8* %exception) #8
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val1 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef i8* @_ZNSt3__1L17__libcpp_allocateEmm(i64 noundef %__size, i64 noundef %__align) #0 {
entry:
  %__size.addr = alloca i64, align 8
  %__align.addr = alloca i64, align 8
  store i64 %__size, i64* %__size.addr, align 8
  store i64 %__align, i64* %__align.addr, align 8
  %0 = load i64, i64* %__size.addr, align 8
  %call = call noundef i8* @_ZNSt3__1L21__libcpp_operator_newIJmEEEPvDpT_(i64 noundef %0)
  ret i8* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNKSt3__19allocatorINS_11__tree_nodeIiPvEEE8max_sizeEv(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  ret i64 576460752303423487
}

declare i8* @__cxa_allocate_exception(i64)

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::length_error"* @_ZNSt12length_errorC1EPKc(%"class.std::length_error"* noundef nonnull returned align 8 dereferenceable(16) %this, i8* noundef %__s) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::length_error"*, align 8
  %__s.addr = alloca i8*, align 8
  store %"class.std::length_error"* %this, %"class.std::length_error"** %this.addr, align 8
  store i8* %__s, i8** %__s.addr, align 8
  %this1 = load %"class.std::length_error"*, %"class.std::length_error"** %this.addr, align 8
  %0 = load i8*, i8** %__s.addr, align 8
  %call = call noundef %"class.std::length_error"* @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* noundef nonnull align 8 dereferenceable(16) %this1, i8* noundef %0)
  ret %"class.std::length_error"* %this1
}

declare void @__cxa_free_exception(i8*)

; Function Attrs: nounwind
declare noundef %"class.std::length_error"* @_ZNSt12length_errorD1Ev(%"class.std::length_error"* noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #15

declare void @__cxa_throw(i8*, i8*, i8*)

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::length_error"* @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* noundef nonnull returned align 8 dereferenceable(16) %this, i8* noundef %__s) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::length_error"*, align 8
  %__s.addr = alloca i8*, align 8
  store %"class.std::length_error"* %this, %"class.std::length_error"** %this.addr, align 8
  store i8* %__s, i8** %__s.addr, align 8
  %this1 = load %"class.std::length_error"*, %"class.std::length_error"** %this.addr, align 8
  %0 = bitcast %"class.std::length_error"* %this1 to %"class.std::logic_error"*
  %1 = load i8*, i8** %__s.addr, align 8
  %call = call noundef %"class.std::logic_error"* @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* noundef nonnull align 8 dereferenceable(16) %0, i8* noundef %1)
  %2 = bitcast %"class.std::length_error"* %this1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12length_error, i32 0, inrange i32 0, i32 2) to i32 (...)**), i32 (...)*** %2, align 8
  ret %"class.std::length_error"* %this1
}

declare noundef %"class.std::logic_error"* @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* noundef nonnull returned align 8 dereferenceable(16), i8* noundef) unnamed_addr #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef i8* @_ZNSt3__1L21__libcpp_operator_newIJmEEEPvDpT_(i64 noundef %__args) #0 {
entry:
  %__args.addr = alloca i64, align 8
  store i64 %__args, i64* %__args.addr, align 8
  %0 = load i64, i64* %__args.addr, align 8
  %call = call noalias noundef nonnull i8* @_Znwm(i64 noundef %0) #21
  ret i8* %call
}

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull i8* @_Znwm(i64 noundef) #16

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node_destructor"* @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEC2ERS5_b(%"class.std::__1::__tree_node_destructor"* noundef nonnull returned align 8 dereferenceable(9) %this, %"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %__na, i1 noundef zeroext %__val) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  %__na.addr = alloca %"class.std::__1::allocator"*, align 8
  %__val.addr = alloca i8, align 1
  store %"class.std::__1::__tree_node_destructor"* %this, %"class.std::__1::__tree_node_destructor"** %this.addr, align 8
  store %"class.std::__1::allocator"* %__na, %"class.std::__1::allocator"** %__na.addr, align 8
  %frombool = zext i1 %__val to i8
  store i8 %frombool, i8* %__val.addr, align 1
  %this1 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %this.addr, align 8
  %__na_ = getelementptr inbounds %"class.std::__1::__tree_node_destructor", %"class.std::__1::__tree_node_destructor"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na.addr, align 8
  store %"class.std::__1::allocator"* %0, %"class.std::__1::allocator"** %__na_, align 8
  %__value_constructed = getelementptr inbounds %"class.std::__1::__tree_node_destructor", %"class.std::__1::__tree_node_destructor"* %this1, i32 0, i32 1
  %1 = load i8, i8* %__val.addr, align 1
  %tobool = trunc i8 %1 to i1
  %frombool2 = zext i1 %tobool to i8
  store i8 %frombool2, i8* %__value_constructed, align 8
  ret %"class.std::__1::__tree_node_destructor"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC2ILb1EvEEPS3_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeIS7_EEXT_EE20__good_rval_ref_typeE(%"class.std::__1::unique_ptr"* noundef nonnull returned align 8 dereferenceable(24) %this, %"class.std::__1::__tree_node"* noundef %__p, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %__d) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  %__d.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  store %"class.std::__1::__tree_node_destructor"* %__d, %"class.std::__1::__tree_node_destructor"** %__d.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %__d.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__1L4moveIRNS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEEEEONS_16remove_referenceIT_E4typeEOSA_(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %0) #8
  %call2 = invoke noundef %"class.std::__1::__compressed_pair.6"* @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC1IRS4_S8_EEOT_OT0_(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_, %"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %__p.addr, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %call)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  ret %"class.std::__1::unique_ptr"* %this1

terminate.lpad:                                   ; preds = %entry
  %1 = landingpad { i8*, i32 }
          catch i8* null
  %2 = extractvalue { i8*, i32 } %1, 0
  call void @__clang_call_terminate(i8* %2) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__1L4moveIRNS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEEEEONS_16remove_referenceIT_E4typeEOSA_(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %__t) #2 {
entry:
  %__t.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  store %"class.std::__1::__tree_node_destructor"* %__t, %"class.std::__1::__tree_node_destructor"** %__t.addr, align 8
  %0 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %__t.addr, align 8
  ret %"class.std::__1::__tree_node_destructor"* %0
}

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair.6"* @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC1IRS4_S8_EEOT_OT0_(%"class.std::__1::__compressed_pair.6"* noundef nonnull returned align 8 dereferenceable(24) %this, %"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %__t1, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %__t2) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.6"*, align 8
  %__t1.addr = alloca %"class.std::__1::__tree_node"**, align 8
  %__t2.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  store %"class.std::__1::__compressed_pair.6"* %this, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  store %"class.std::__1::__tree_node"** %__t1, %"class.std::__1::__tree_node"*** %__t1.addr, align 8
  store %"class.std::__1::__tree_node_destructor"* %__t2, %"class.std::__1::__tree_node_destructor"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.6"*, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node"**, %"class.std::__1::__tree_node"*** %__t1.addr, align 8
  %1 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %__t2.addr, align 8
  %call = call noundef %"class.std::__1::__compressed_pair.6"* @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC2IRS4_S8_EEOT_OT0_(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %0, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %1)
  ret %"class.std::__1::__compressed_pair.6"* %this1
}

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair.6"* @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEEC2IRS4_S8_EEOT_OT0_(%"class.std::__1::__compressed_pair.6"* noundef nonnull returned align 8 dereferenceable(24) %this, %"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %__t1, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %__t2) unnamed_addr #11 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.6"*, align 8
  %__t1.addr = alloca %"class.std::__1::__tree_node"**, align 8
  %__t2.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  store %"class.std::__1::__compressed_pair.6"* %this, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  store %"class.std::__1::__tree_node"** %__t1, %"class.std::__1::__tree_node"*** %__t1.addr, align 8
  store %"class.std::__1::__tree_node_destructor"* %__t2, %"class.std::__1::__tree_node_destructor"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.6"*, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair.6"* %this1 to %"struct.std::__1::__compressed_pair_elem.7"*
  %1 = load %"class.std::__1::__tree_node"**, %"class.std::__1::__tree_node"*** %__t1.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__1L7forwardIRPNS_11__tree_nodeIiPvEEEEOT_RNS_16remove_referenceIS6_E4typeE(%"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %1) #8
  %call2 = call noundef %"struct.std::__1::__compressed_pair_elem.7"* @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeIiPvEELi0ELb0EEC2IRS4_vEEOT_(%"struct.std::__1::__compressed_pair_elem.7"* noundef nonnull align 8 dereferenceable(8) %0, %"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %call)
  %2 = bitcast %"class.std::__1::__compressed_pair.6"* %this1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 8
  %4 = bitcast i8* %3 to %"struct.std::__1::__compressed_pair_elem.8"*
  %5 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %__t2.addr, align 8
  %call3 = call noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__1L7forwardINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEEEEOT_RNS_16remove_referenceIS8_E4typeE(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %5) #8
  %call4 = call noundef %"struct.std::__1::__compressed_pair_elem.8"* @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEELi1ELb0EEC2IS7_vEEOT_(%"struct.std::__1::__compressed_pair_elem.8"* noundef nonnull align 8 dereferenceable(16) %4, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %call3)
  ret %"class.std::__1::__compressed_pair.6"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__1L7forwardIRPNS_11__tree_nodeIiPvEEEEOT_RNS_16remove_referenceIS6_E4typeE(%"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %__t) #2 {
entry:
  %__t.addr = alloca %"class.std::__1::__tree_node"**, align 8
  store %"class.std::__1::__tree_node"** %__t, %"class.std::__1::__tree_node"*** %__t.addr, align 8
  %0 = load %"class.std::__1::__tree_node"**, %"class.std::__1::__tree_node"*** %__t.addr, align 8
  ret %"class.std::__1::__tree_node"** %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem.7"* @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeIiPvEELi0ELb0EEC2IRS4_vEEOT_(%"struct.std::__1::__compressed_pair_elem.7"* noundef nonnull returned align 8 dereferenceable(8) %this, %"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %__u) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.7"*, align 8
  %__u.addr = alloca %"class.std::__1::__tree_node"**, align 8
  store %"struct.std::__1::__compressed_pair_elem.7"* %this, %"struct.std::__1::__compressed_pair_elem.7"** %this.addr, align 8
  store %"class.std::__1::__tree_node"** %__u, %"class.std::__1::__tree_node"*** %__u.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.7"*, %"struct.std::__1::__compressed_pair_elem.7"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.7", %"struct.std::__1::__compressed_pair_elem.7"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_node"**, %"class.std::__1::__tree_node"*** %__u.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__1L7forwardIRPNS_11__tree_nodeIiPvEEEEOT_RNS_16remove_referenceIS6_E4typeE(%"class.std::__1::__tree_node"** noundef nonnull align 8 dereferenceable(8) %0) #8
  %1 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %call, align 8
  store %"class.std::__1::__tree_node"* %1, %"class.std::__1::__tree_node"** %__value_, align 8
  ret %"struct.std::__1::__compressed_pair_elem.7"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__1L7forwardINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEEEEOT_RNS_16remove_referenceIS8_E4typeE(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %__t) #2 {
entry:
  %__t.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  store %"class.std::__1::__tree_node_destructor"* %__t, %"class.std::__1::__tree_node_destructor"** %__t.addr, align 8
  %0 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %__t.addr, align 8
  ret %"class.std::__1::__tree_node_destructor"* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem.8"* @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEELi1ELb0EEC2IS7_vEEOT_(%"struct.std::__1::__compressed_pair_elem.8"* noundef nonnull returned align 8 dereferenceable(16) %this, %"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %__u) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.8"*, align 8
  %__u.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.8"* %this, %"struct.std::__1::__compressed_pair_elem.8"** %this.addr, align 8
  store %"class.std::__1::__tree_node_destructor"* %__u, %"class.std::__1::__tree_node_destructor"** %__u.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.8"*, %"struct.std::__1::__compressed_pair_elem.8"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.8", %"struct.std::__1::__compressed_pair_elem.8"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %__u.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__1L7forwardINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEEEEOT_RNS_16remove_referenceIS8_E4typeE(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %0) #8
  %1 = bitcast %"class.std::__1::__tree_node_destructor"* %__value_ to i8*
  %2 = bitcast %"class.std::__1::__tree_node_destructor"* %call to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 16, i1 false)
  ret %"struct.std::__1::__compressed_pair_elem.8"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__19allocatorINS_11__tree_nodeIiPvEEE9constructIiJRKiEEEvPT_DpOT0_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %this, i32* noundef %__p, i32* noundef nonnull align 4 dereferenceable(4) %__args) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  %__p.addr = alloca i32*, align 8
  %__args.addr = alloca i32*, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  store i32* %__p, i32** %__p.addr, align 8
  store i32* %__args, i32** %__args.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  %0 = load i32*, i32** %__p.addr, align 8
  %1 = bitcast i32* %0 to i8*
  %2 = bitcast i8* %1 to i32*
  %3 = load i32*, i32** %__args.addr, align 8
  %call = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNSt3__1L7forwardIRKiEEOT_RNS_16remove_referenceIS3_E4typeE(i32* noundef nonnull align 4 dereferenceable(4) %3) #8
  %4 = load i32, i32* %call, align 4
  store i32 %4, i32* %2, align 4
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNKSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.6"*, align 8
  store %"class.std::__1::__compressed_pair.6"* %this, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.6"*, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair.6"* %this1 to %"struct.std::__1::__compressed_pair_elem.7"*
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNKSt3__122__compressed_pair_elemIPNS_11__tree_nodeIiPvEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.7"* noundef nonnull align 8 dereferenceable(8) %0) #8
  ret %"class.std::__1::__tree_node"** %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNKSt3__122__compressed_pair_elemIPNS_11__tree_nodeIiPvEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.7"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.7"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.7"* %this, %"struct.std::__1::__compressed_pair_elem.7"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.7"*, %"struct.std::__1::__compressed_pair_elem.7"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.7", %"struct.std::__1::__compressed_pair_elem.7"* %this1, i32 0, i32 0
  ret %"class.std::__1::__tree_node"** %__value_
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE6secondEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.6"*, align 8
  store %"class.std::__1::__compressed_pair.6"* %this, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.6"*, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair.6"* %this1 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 8
  %1 = bitcast i8* %add.ptr to %"struct.std::__1::__compressed_pair_elem.8"*
  %call = call noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEELi1ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.8"* noundef nonnull align 8 dereferenceable(16) %1) #8
  ret %"class.std::__1::__tree_node_destructor"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEELi1ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.8"* noundef nonnull align 8 dereferenceable(16) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.8"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.8"* %this, %"struct.std::__1::__compressed_pair_elem.8"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.8"*, %"struct.std::__1::__compressed_pair_elem.8"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.8", %"struct.std::__1::__compressed_pair_elem.8"* %this1, i32 0, i32 0
  ret %"class.std::__1::__tree_node_destructor"* %__value_
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNSt3__127__tree_balance_after_insertIPNS_16__tree_node_baseIPvEEEEvT_S5_(%"class.std::__1::__tree_node_base"* noundef %__root, %"class.std::__1::__tree_node_base"* noundef %__x) #2 {
entry:
  %__root.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__x.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__y = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__y27 = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %__root, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  store %"class.std::__1::__tree_node_base"* %__x, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %1 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp = icmp eq %"class.std::__1::__tree_node_base"* %0, %1
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %2, i32 0, i32 3
  %frombool = zext i1 %cmp to i8
  store i8 %frombool, i8* %__is_black_, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end51, %entry
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %4 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp1 = icmp ne %"class.std::__1::__tree_node_base"* %3, %4
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %5)
  %__is_black_2 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call, i32 0, i32 3
  %6 = load i8, i8* %__is_black_2, align 8
  %tobool = trunc i8 %6 to i1
  %lnot = xor i1 %tobool, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %7 = phi i1 [ false, %while.cond ], [ %lnot, %land.rhs ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %8 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call3 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %8)
  %call4 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %call3) #8
  br i1 %call4, label %if.then, label %if.else26

if.then:                                          ; preds = %while.body
  %9 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call5 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %9)
  %call6 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %call5)
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call6, i32 0, i32 1
  %10 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  store %"class.std::__1::__tree_node_base"* %10, %"class.std::__1::__tree_node_base"** %__y, align 8
  %11 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %cmp7 = icmp ne %"class.std::__1::__tree_node_base"* %11, null
  br i1 %cmp7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then
  %12 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__is_black_8 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %12, i32 0, i32 3
  %13 = load i8, i8* %__is_black_8, align 8
  %tobool9 = trunc i8 %13 to i1
  br i1 %tobool9, label %if.else, label %if.then10

if.then10:                                        ; preds = %land.lhs.true
  %14 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call11 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %14)
  store %"class.std::__1::__tree_node_base"* %call11, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %15 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_12 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %15, i32 0, i32 3
  store i8 1, i8* %__is_black_12, align 8
  %16 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call13 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %16)
  store %"class.std::__1::__tree_node_base"* %call13, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %17 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %18 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp14 = icmp eq %"class.std::__1::__tree_node_base"* %17, %18
  %19 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_15 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %19, i32 0, i32 3
  %frombool16 = zext i1 %cmp14 to i8
  store i8 %frombool16, i8* %__is_black_15, align 8
  %20 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__is_black_17 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %20, i32 0, i32 3
  store i8 1, i8* %__is_black_17, align 8
  br label %if.end25

if.else:                                          ; preds = %land.lhs.true, %if.then
  %21 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call18 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %21) #8
  br i1 %call18, label %if.end, label %if.then19

if.then19:                                        ; preds = %if.else
  %22 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call20 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %22)
  store %"class.std::__1::__tree_node_base"* %call20, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %23 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  call void @_ZNSt3__118__tree_left_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %23) #8
  br label %if.end

if.end:                                           ; preds = %if.then19, %if.else
  %24 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call21 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %24)
  store %"class.std::__1::__tree_node_base"* %call21, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %25 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_22 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %25, i32 0, i32 3
  store i8 1, i8* %__is_black_22, align 8
  %26 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call23 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %26)
  store %"class.std::__1::__tree_node_base"* %call23, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %27 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_24 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %27, i32 0, i32 3
  store i8 0, i8* %__is_black_24, align 8
  %28 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  call void @_ZNSt3__119__tree_right_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %28) #8
  br label %while.end

if.end25:                                         ; preds = %if.then10
  br label %if.end51

if.else26:                                        ; preds = %while.body
  %29 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call28 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %29)
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call28, i32 0, i32 2
  %30 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %30, i32 0, i32 0
  %31 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  store %"class.std::__1::__tree_node_base"* %31, %"class.std::__1::__tree_node_base"** %__y27, align 8
  %32 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y27, align 8
  %cmp29 = icmp ne %"class.std::__1::__tree_node_base"* %32, null
  br i1 %cmp29, label %land.lhs.true30, label %if.else41

land.lhs.true30:                                  ; preds = %if.else26
  %33 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y27, align 8
  %__is_black_31 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %33, i32 0, i32 3
  %34 = load i8, i8* %__is_black_31, align 8
  %tobool32 = trunc i8 %34 to i1
  br i1 %tobool32, label %if.else41, label %if.then33

if.then33:                                        ; preds = %land.lhs.true30
  %35 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call34 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %35)
  store %"class.std::__1::__tree_node_base"* %call34, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %36 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_35 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %36, i32 0, i32 3
  store i8 1, i8* %__is_black_35, align 8
  %37 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call36 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %37)
  store %"class.std::__1::__tree_node_base"* %call36, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %38 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %39 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp37 = icmp eq %"class.std::__1::__tree_node_base"* %38, %39
  %40 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_38 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %40, i32 0, i32 3
  %frombool39 = zext i1 %cmp37 to i8
  store i8 %frombool39, i8* %__is_black_38, align 8
  %41 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y27, align 8
  %__is_black_40 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %41, i32 0, i32 3
  store i8 1, i8* %__is_black_40, align 8
  br label %if.end50

if.else41:                                        ; preds = %land.lhs.true30, %if.else26
  %42 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call42 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %42) #8
  br i1 %call42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %if.else41
  %43 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call44 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %43)
  store %"class.std::__1::__tree_node_base"* %call44, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %44 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  call void @_ZNSt3__119__tree_right_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %44) #8
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %if.else41
  %45 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call46 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %45)
  store %"class.std::__1::__tree_node_base"* %call46, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %46 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_47 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %46, i32 0, i32 3
  store i8 1, i8* %__is_black_47, align 8
  %47 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call48 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %47)
  store %"class.std::__1::__tree_node_base"* %call48, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %48 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__is_black_49 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %48, i32 0, i32 3
  store i8 0, i8* %__is_black_49, align 8
  %49 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  call void @_ZNSt3__118__tree_left_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %49) #8
  br label %while.end

if.end50:                                         ; preds = %if.then33
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end25
  br label %while.cond, !llvm.loop !17

while.end:                                        ; preds = %if.end45, %if.end, %land.end
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) i64* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE4sizeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %__pair3_ = getelementptr inbounds %"class.std::__1::__tree", %"class.std::__1::__tree"* %this1, i32 0, i32 2
  %call = call noundef nonnull align 8 dereferenceable(8) i64* @_ZNSt3__117__compressed_pairImNS_4lessIiEEE5firstEv(%"class.std::__1::__compressed_pair.1"* noundef nonnull align 8 dereferenceable(8) %__pair3_) #8
  ret i64* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNSt3__118__tree_left_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %__x) #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__y = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %__x, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %0, i32 0, i32 1
  %1 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  store %"class.std::__1::__tree_node_base"* %1, %"class.std::__1::__tree_node_base"** %__y, align 8
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %3 = bitcast %"class.std::__1::__tree_node_base"* %2 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %3, i32 0, i32 0
  %4 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_1 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %5, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* %4, %"class.std::__1::__tree_node_base"** %__right_1, align 8
  %6 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_2 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %6, i32 0, i32 1
  %7 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_2, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node_base"* %7, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_3 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %8, i32 0, i32 1
  %9 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_3, align 8
  %10 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  invoke void @_ZNSt3__116__tree_node_baseIPvE12__set_parentEPS2_(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %9, %"class.std::__1::__tree_node_base"* noundef %10)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %if.then
  br label %if.end

if.end:                                           ; preds = %invoke.cont, %entry
  %11 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %11, i32 0, i32 2
  %12 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  %13 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__parent_4 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %13, i32 0, i32 2
  store %"class.std::__1::__tree_end_node"* %12, %"class.std::__1::__tree_end_node"** %__parent_4, align 8
  %14 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %14) #8
  br i1 %call, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  %15 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %16 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__parent_6 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %16, i32 0, i32 2
  %17 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_6, align 8
  %__left_7 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %17, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* %15, %"class.std::__1::__tree_node_base"** %__left_7, align 8
  br label %if.end10

if.else:                                          ; preds = %if.end
  %18 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %19 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call8 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %19)
  %__right_9 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call8, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* %18, %"class.std::__1::__tree_node_base"** %__right_9, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then5
  %20 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %21 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %22 = bitcast %"class.std::__1::__tree_node_base"* %21 to %"class.std::__1::__tree_end_node"*
  %__left_11 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %22, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* %20, %"class.std::__1::__tree_node_base"** %__left_11, align 8
  %23 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %24 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  invoke void @_ZNSt3__116__tree_node_baseIPvE12__set_parentEPS2_(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %23, %"class.std::__1::__tree_node_base"* noundef %24)
          to label %invoke.cont12 unwind label %terminate.lpad

invoke.cont12:                                    ; preds = %if.end10
  ret void

terminate.lpad:                                   ; preds = %if.end10, %if.then
  %25 = landingpad { i8*, i32 }
          catch i8* null
  %26 = extractvalue { i8*, i32 } %25, 0
  call void @__clang_call_terminate(i8* %26) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNSt3__119__tree_right_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %__x) #2 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__y = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %__x, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_node_base"* %0 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %1, i32 0, i32 0
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  store %"class.std::__1::__tree_node_base"* %2, %"class.std::__1::__tree_node_base"** %__y, align 8
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %3, i32 0, i32 1
  %4 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %6 = bitcast %"class.std::__1::__tree_node_base"* %5 to %"class.std::__1::__tree_end_node"*
  %__left_1 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %6, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* %4, %"class.std::__1::__tree_node_base"** %__left_1, align 8
  %7 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %8 = bitcast %"class.std::__1::__tree_node_base"* %7 to %"class.std::__1::__tree_end_node"*
  %__left_2 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %8, i32 0, i32 0
  %9 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_2, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node_base"* %9, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %10 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %11 = bitcast %"class.std::__1::__tree_node_base"* %10 to %"class.std::__1::__tree_end_node"*
  %__left_3 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %11, i32 0, i32 0
  %12 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_3, align 8
  %13 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  call void @_ZNSt3__116__tree_node_baseIPvE12__set_parentEPS2_(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %12, %"class.std::__1::__tree_node_base"* noundef %13)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %14, i32 0, i32 2
  %15 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  %16 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__parent_4 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %16, i32 0, i32 2
  store %"class.std::__1::__tree_end_node"* %15, %"class.std::__1::__tree_end_node"** %__parent_4, align 8
  %17 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %17) #8
  br i1 %call, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  %18 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %19 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__parent_6 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %19, i32 0, i32 2
  %20 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_6, align 8
  %__left_7 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %20, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* %18, %"class.std::__1::__tree_node_base"** %__left_7, align 8
  br label %if.end10

if.else:                                          ; preds = %if.end
  %21 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %22 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call8 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %22)
  %__right_9 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call8, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* %21, %"class.std::__1::__tree_node_base"** %__right_9, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then5
  %23 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %24 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__right_11 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %24, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* %23, %"class.std::__1::__tree_node_base"** %__right_11, align 8
  %25 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %26 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  call void @_ZNSt3__116__tree_node_baseIPvE12__set_parentEPS2_(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %25, %"class.std::__1::__tree_node_base"* noundef %26)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__116__tree_node_baseIPvE12__set_parentEPS2_(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %this, %"class.std::__1::__tree_node_base"* noundef %__p) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %this, %"class.std::__1::__tree_node_base"** %this.addr, align 8
  store %"class.std::__1::__tree_node_base"* %__p, %"class.std::__1::__tree_node_base"** %__p.addr, align 8
  %this1 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__p.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_node_base"* %0 to %"class.std::__1::__tree_end_node"*
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %this1, i32 0, i32 2
  store %"class.std::__1::__tree_end_node"* %1, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) i64* @_ZNSt3__117__compressed_pairImNS_4lessIiEEE5firstEv(%"class.std::__1::__compressed_pair.1"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.1"*, align 8
  store %"class.std::__1::__compressed_pair.1"* %this, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.1"*, %"class.std::__1::__compressed_pair.1"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair.1"* %this1 to %"struct.std::__1::__compressed_pair_elem.2"*
  %call = call noundef nonnull align 8 dereferenceable(8) i64* @_ZNSt3__122__compressed_pair_elemImLi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.2"* noundef nonnull align 8 dereferenceable(8) %0) #8
  ret i64* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) i64* @_ZNSt3__122__compressed_pair_elemImLi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.2"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.2"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.2"* %this, %"struct.std::__1::__compressed_pair_elem.2"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.2"*, %"struct.std::__1::__compressed_pair_elem.2"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.2", %"struct.std::__1::__compressed_pair_elem.2"* %this1, i32 0, i32 0
  ret i64* %__value_
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair.6"*, align 8
  store %"class.std::__1::__compressed_pair.6"* %this, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair.6"*, %"class.std::__1::__compressed_pair.6"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair.6"* %this1 to %"struct.std::__1::__compressed_pair_elem.7"*
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeIiPvEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.7"* noundef nonnull align 8 dereferenceable(8) %0) #8
  ret %"class.std::__1::__tree_node"** %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeIiPvEELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem.7"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.7"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.7"* %this, %"struct.std::__1::__compressed_pair_elem.7"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.7"*, %"struct.std::__1::__compressed_pair_elem.7"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.7", %"struct.std::__1::__compressed_pair_elem.7"* %this1, i32 0, i32 0
  ret %"class.std::__1::__tree_node"** %__value_
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::unique_ptr"* @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEED2Ev(%"class.std::__1::unique_ptr"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  call void @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5resetEPS3_(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_node"* noundef null) #8
  ret %"class.std::__1::unique_ptr"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__110unique_ptrINS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5resetEPS3_(%"class.std::__1::unique_ptr"* noundef nonnull align 8 dereferenceable(24) %this, %"class.std::__1::__tree_node"* noundef %__p) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::unique_ptr"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  %__tmp = alloca %"class.std::__1::__tree_node"*, align 8
  store %"class.std::__1::unique_ptr"* %this, %"class.std::__1::unique_ptr"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::__1::unique_ptr"*, %"class.std::__1::unique_ptr"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_) #8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %call, align 8
  store %"class.std::__1::__tree_node"* %0, %"class.std::__1::__tree_node"** %__tmp, align 8
  %1 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %__ptr_2 = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call3 = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_node"** @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE5firstEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_2) #8
  store %"class.std::__1::__tree_node"* %1, %"class.std::__1::__tree_node"** %call3, align 8
  %2 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__tmp, align 8
  %tobool = icmp ne %"class.std::__1::__tree_node"* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %__ptr_4 = getelementptr inbounds %"class.std::__1::unique_ptr", %"class.std::__1::unique_ptr"* %this1, i32 0, i32 0
  %call5 = call noundef nonnull align 8 dereferenceable(9) %"class.std::__1::__tree_node_destructor"* @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeIiPvEENS_22__tree_node_destructorINS_9allocatorIS3_EEEEE6secondEv(%"class.std::__1::__compressed_pair.6"* noundef nonnull align 8 dereferenceable(24) %__ptr_4) #8
  %3 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__tmp, align 8
  call void @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEclEPS4_(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %call5, %"class.std::__1::__tree_node"* noundef %3) #8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeIiPvEEEEEclEPS4_(%"class.std::__1::__tree_node_destructor"* noundef nonnull align 8 dereferenceable(9) %this, %"class.std::__1::__tree_node"* noundef %__p) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_node_destructor"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  store %"class.std::__1::__tree_node_destructor"* %this, %"class.std::__1::__tree_node_destructor"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::__1::__tree_node_destructor"*, %"class.std::__1::__tree_node_destructor"** %this.addr, align 8
  %__value_constructed = getelementptr inbounds %"class.std::__1::__tree_node_destructor", %"class.std::__1::__tree_node_destructor"* %this1, i32 0, i32 1
  %0 = load i8, i8* %__value_constructed, align 8
  %tobool = trunc i8 %0 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %__na_ = getelementptr inbounds %"class.std::__1::__tree_node_destructor", %"class.std::__1::__tree_node_destructor"* %this1, i32 0, i32 0
  %1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na_, align 8
  %2 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %__value_ = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %2, i32 0, i32 1
  %call = call noundef i32* @_ZNSt3__122__tree_key_value_typesIiE9__get_ptrERi(i32* noundef nonnull align 4 dereferenceable(4) %__value_)
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE7destroyIivvEEvRS5_PT_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %1, i32* noundef %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %tobool2 = icmp ne %"class.std::__1::__tree_node"* %3, null
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %__na_4 = getelementptr inbounds %"class.std::__1::__tree_node_destructor", %"class.std::__1::__tree_node_destructor"* %this1, i32 0, i32 0
  %4 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na_4, align 8
  %5 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE10deallocateERS5_PS4_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %4, %"class.std::__1::__tree_node"* noundef %5, i64 noundef 1) #8
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC2ES4_(%"class.std::__1::__tree_iterator"* noundef nonnull returned align 8 dereferenceable(8) %this, %"class.std::__1::__tree_node"* noundef %__p) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__p.addr = alloca %"class.std::__1::__tree_node"*, align 8
  store %"class.std::__1::__tree_iterator"* %this, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__p, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %this1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__p.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_node"* %0 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %1, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  ret %"class.std::__1::__tree_iterator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::pair.4"* @_ZNSt3__14pairINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC2IS6_RbLb0EEEOT_OT0_(%"struct.std::__1::pair.4"* noundef nonnull returned align 8 dereferenceable(9) %this, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__u1, i8* noundef nonnull align 1 dereferenceable(1) %__u2) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::pair.4"*, align 8
  %__u1.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__u2.addr = alloca i8*, align 8
  store %"struct.std::__1::pair.4"* %this, %"struct.std::__1::pair.4"** %this.addr, align 8
  store %"class.std::__1::__tree_iterator"* %__u1, %"class.std::__1::__tree_iterator"** %__u1.addr, align 8
  store i8* %__u2, i8** %__u2.addr, align 8
  %this1 = load %"struct.std::__1::pair.4"*, %"struct.std::__1::pair.4"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::__1::pair.4", %"struct.std::__1::pair.4"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %__u1.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_iterator"* @_ZNSt3__1L7forwardINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEEEOT_RNS_16remove_referenceIS7_E4typeE(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %0) #8
  %1 = bitcast %"class.std::__1::__tree_iterator"* %first to i8*
  %2 = bitcast %"class.std::__1::__tree_iterator"* %call to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 8, i1 false)
  %second = getelementptr inbounds %"struct.std::__1::pair.4", %"struct.std::__1::pair.4"* %this1, i32 0, i32 1
  %3 = load i8*, i8** %__u2.addr, align 8
  %call2 = call noundef nonnull align 1 dereferenceable(1) i8* @_ZNSt3__1L7forwardIRbEEOT_RNS_16remove_referenceIS2_E4typeE(i8* noundef nonnull align 1 dereferenceable(1) %3) #8
  %4 = load i8, i8* %call2, align 1
  %tobool = trunc i8 %4 to i1
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %second, align 8
  ret %"struct.std::__1::pair.4"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_iterator"* @_ZNSt3__1L7forwardINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEEEOT_RNS_16remove_referenceIS7_E4typeE(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__t) #2 {
entry:
  %__t.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  store %"class.std::__1::__tree_iterator"* %__t, %"class.std::__1::__tree_iterator"** %__t.addr, align 8
  %0 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %__t.addr, align 8
  ret %"class.std::__1::__tree_iterator"* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) i8* @_ZNSt3__1L7forwardIRbEEOT_RNS_16remove_referenceIS2_E4typeE(i8* noundef nonnull align 1 dereferenceable(1) %__t) #2 {
entry:
  %__t.addr = alloca i8*, align 8
  store i8* %__t, i8** %__t.addr, align 8
  %0 = load i8*, i8** %__t.addr, align 8
  ret i8* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::pair"* @_ZNSt3__14pairINS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEEbEC2INS_15__tree_iteratorIiS5_lEEbLb0EEEONS0_IT_T0_EE(%"struct.std::__1::pair"* noundef nonnull returned align 8 dereferenceable(9) %this, %"struct.std::__1::pair.4"* noundef nonnull align 8 dereferenceable(9) %__p) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::pair"*, align 8
  %__p.addr = alloca %"struct.std::__1::pair.4"*, align 8
  %agg.tmp = alloca %"class.std::__1::__tree_iterator", align 8
  store %"struct.std::__1::pair"* %this, %"struct.std::__1::pair"** %this.addr, align 8
  store %"struct.std::__1::pair.4"* %__p, %"struct.std::__1::pair.4"** %__p.addr, align 8
  %this1 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %this.addr, align 8
  %first = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %this1, i32 0, i32 0
  %0 = load %"struct.std::__1::pair.4"*, %"struct.std::__1::pair.4"** %__p.addr, align 8
  %first2 = getelementptr inbounds %"struct.std::__1::pair.4", %"struct.std::__1::pair.4"* %0, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_iterator"* @_ZNSt3__1L7forwardINS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEEEEOT_RNS_16remove_referenceIS7_E4typeE(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %first2) #8
  %1 = bitcast %"class.std::__1::__tree_iterator"* %agg.tmp to i8*
  %2 = bitcast %"class.std::__1::__tree_iterator"* %call to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 8, i1 false)
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp, i32 0, i32 0
  %3 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %3 to i64
  %call3 = call noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC1ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %first, i64 %coerce.val.pi) #8
  %second = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %this1, i32 0, i32 1
  %4 = load %"struct.std::__1::pair.4"*, %"struct.std::__1::pair.4"** %__p.addr, align 8
  %second4 = getelementptr inbounds %"struct.std::__1::pair.4", %"struct.std::__1::pair.4"* %4, i32 0, i32 1
  %call5 = call noundef nonnull align 1 dereferenceable(1) i8* @_ZNSt3__1L7forwardIbEEOT_RNS_16remove_referenceIS1_E4typeE(i8* noundef nonnull align 1 dereferenceable(1) %second4) #8
  %5 = load i8, i8* %call5, align 1
  %tobool = trunc i8 %5 to i1
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %second, align 8
  ret %"struct.std::__1::pair"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) i8* @_ZNSt3__1L7forwardIbEEOT_RNS_16remove_referenceIS1_E4typeE(i8* noundef nonnull align 1 dereferenceable(1) %__t) #2 {
entry:
  %__t.addr = alloca i8*, align 8
  store i8* %__t, i8** %__t.addr, align 8
  %0 = load i8*, i8** %__t.addr, align 8
  ret i8* %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define linkonce_odr i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE4findIiEENS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEERKT_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__v) #0 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__v.addr = alloca i32*, align 8
  %__p = alloca %"class.std::__1::__tree_iterator", align 8
  %ref.tmp = alloca %"class.std::__1::__tree_iterator", align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store i32* %__v, i32** %__v.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load i32*, i32** %__v.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE6__rootEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %call2 = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %call3 = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE13__lower_boundIiEENS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEERKT_SB_PNS_15__tree_end_nodeIPNS_16__tree_node_baseIS9_EEEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, i32* noundef nonnull align 4 dereferenceable(4) %0, %"class.std::__1::__tree_node"* noundef %call, %"class.std::__1::__tree_end_node"* noundef %call2)
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %__p, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call3 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %call4 = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %coerce.dive5 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %ref.tmp, i32 0, i32 0
  %coerce.val.ip6 = inttoptr i64 %call4 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip6, %"class.std::__1::__tree_end_node"** %coerce.dive5, align 8
  %call7 = call noundef zeroext i1 @_ZNSt3__1neERKNS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__p, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %ref.tmp)
  br i1 %call7, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %call8 = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10value_compEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %1 = load i32*, i32** %__v.addr, align 8
  %call9 = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNKSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEdeEv(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__p)
  %call10 = call noundef zeroext i1 @_ZNKSt3__14lessIiEclERKiS3_(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %call8, i32* noundef nonnull align 4 dereferenceable(4) %1, i32* noundef nonnull align 4 dereferenceable(4) %call9)
  %lnot = xor i1 %call10, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %lnot, %land.rhs ]
  br i1 %2, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  %3 = bitcast %"class.std::__1::__tree_iterator"* %retval to i8*
  %4 = bitcast %"class.std::__1::__tree_iterator"* %__p to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 8 %4, i64 8, i1 false)
  br label %return

if.end:                                           ; preds = %land.end
  %call11 = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %coerce.dive12 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %coerce.val.ip13 = inttoptr i64 %call11 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip13, %"class.std::__1::__tree_end_node"** %coerce.dive12, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %coerce.dive14 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %5 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive14, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %5 to i64
  ret i64 %coerce.val.pi
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE13__lower_boundIiEENS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEERKT_SB_PNS_15__tree_end_nodeIPNS_16__tree_node_baseIS9_EEEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__v, %"class.std::__1::__tree_node"* noundef %__root, %"class.std::__1::__tree_end_node"* noundef %__result) #2 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__v.addr = alloca i32*, align 8
  %__root.addr = alloca %"class.std::__1::__tree_node"*, align 8
  %__result.addr = alloca %"class.std::__1::__tree_end_node"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store i32* %__v, i32** %__v.addr, align 8
  store %"class.std::__1::__tree_node"* %__root, %"class.std::__1::__tree_node"** %__root.addr, align 8
  store %"class.std::__1::__tree_end_node"* %__result, %"class.std::__1::__tree_end_node"** %__result.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__root.addr, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node"* %0, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::less"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10value_compEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %1 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__root.addr, align 8
  %__value_ = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %1, i32 0, i32 1
  %2 = load i32*, i32** %__v.addr, align 8
  %call2 = call noundef zeroext i1 @_ZNKSt3__14lessIiEclERKiS3_(%"struct.std::__1::less"* noundef nonnull align 1 dereferenceable(1) %call, i32* noundef nonnull align 4 dereferenceable(4) %__value_, i32* noundef nonnull align 4 dereferenceable(4) %2)
  br i1 %call2, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %3 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__root.addr, align 8
  %4 = bitcast %"class.std::__1::__tree_node"* %3 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %4, %"class.std::__1::__tree_end_node"** %__result.addr, align 8
  %5 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__root.addr, align 8
  %6 = bitcast %"class.std::__1::__tree_node"* %5 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %6, i32 0, i32 0
  %7 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %8 = bitcast %"class.std::__1::__tree_node_base"* %7 to %"class.std::__1::__tree_node"*
  store %"class.std::__1::__tree_node"* %8, %"class.std::__1::__tree_node"** %__root.addr, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %9 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__root.addr, align 8
  %10 = bitcast %"class.std::__1::__tree_node"* %9 to %"class.std::__1::__tree_node_base"*
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %10, i32 0, i32 1
  %11 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %12 = bitcast %"class.std::__1::__tree_node_base"* %11 to %"class.std::__1::__tree_node"*
  store %"class.std::__1::__tree_node"* %12, %"class.std::__1::__tree_node"** %__root.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !llvm.loop !18

while.end:                                        ; preds = %while.cond
  %13 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__result.addr, align 8
  %call3 = call noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC1EPNS_15__tree_end_nodeIPNS_16__tree_node_baseIS2_EEEE(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %retval, %"class.std::__1::__tree_end_node"* noundef %13) #8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %14 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %14 to i64
  ret i64 %coerce.val.pi
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef zeroext i1 @_ZNSt3__1neERKNS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__x, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__y) #0 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__y.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  store %"class.std::__1::__tree_iterator"* %__x, %"class.std::__1::__tree_iterator"** %__x.addr, align 8
  store %"class.std::__1::__tree_iterator"* %__y, %"class.std::__1::__tree_iterator"** %__y.addr, align 8
  %0 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %__x.addr, align 8
  %1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %__y.addr, align 8
  %call = call noundef zeroext i1 @_ZNSt3__1eqERKNS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %0, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %1)
  %lnot = xor i1 %call, true
  ret i1 %lnot
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef nonnull align 4 dereferenceable(4) i32* @_ZNKSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEdeEv(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %this) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  store %"class.std::__1::__tree_iterator"* %this, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElE8__get_npEv(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %this1)
  %__value_ = getelementptr inbounds %"class.std::__1::__tree_node", %"class.std::__1::__tree_node"* %call, i32 0, i32 1
  ret i32* %__value_
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i1 @_ZNSt3__1eqERKNS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__x, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__y) #2 {
entry:
  %__x.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  %__y.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  store %"class.std::__1::__tree_iterator"* %__x, %"class.std::__1::__tree_iterator"** %__x.addr, align 8
  store %"class.std::__1::__tree_iterator"* %__y, %"class.std::__1::__tree_iterator"** %__y.addr, align 8
  %0 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %__x.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %0, i32 0, i32 0
  %1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  %2 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %__y.addr, align 8
  %__ptr_1 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %2, i32 0, i32 0
  %3 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_1, align 8
  %cmp = icmp eq %"class.std::__1::__tree_end_node"* %1, %3
  ret i1 %cmp
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::__tree_node"* @_ZNKSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElE8__get_npEv(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  store %"class.std::__1::__tree_iterator"* %this, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  %1 = bitcast %"class.std::__1::__tree_end_node"* %0 to %"class.std::__1::__tree_node"*
  ret %"class.std::__1::__tree_node"* %1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define linkonce_odr noundef i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE14__erase_uniqueIiEEmRKT_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, i32* noundef nonnull align 4 dereferenceable(4) %__k) #0 align 2 {
entry:
  %retval = alloca i64, align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__k.addr = alloca i32*, align 8
  %__i = alloca %"class.std::__1::__tree_iterator", align 8
  %ref.tmp = alloca %"class.std::__1::__tree_iterator", align 8
  %agg.tmp = alloca %"class.std::__1::__tree_const_iterator", align 8
  %agg.tmp6 = alloca %"class.std::__1::__tree_iterator", align 8
  %coerce = alloca %"class.std::__1::__tree_iterator", align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store i32* %__k, i32** %__k.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load i32*, i32** %__k.addr, align 8
  %call = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE4findIiEENS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEERKT_(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, i32* noundef nonnull align 4 dereferenceable(4) %0)
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %__i, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %call to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %call2 = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE3endEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %coerce.dive3 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %ref.tmp, i32 0, i32 0
  %coerce.val.ip4 = inttoptr i64 %call2 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip4, %"class.std::__1::__tree_end_node"** %coerce.dive3, align 8
  %call5 = call noundef zeroext i1 @_ZNSt3__1eqERKNS_15__tree_iteratorIiPNS_11__tree_nodeIiPvEElEES7_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %__i, %"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %ref.tmp)
  br i1 %call5, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %"class.std::__1::__tree_iterator"* %agg.tmp6 to i8*
  %2 = bitcast %"class.std::__1::__tree_iterator"* %__i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 %2, i64 8, i1 false)
  %coerce.dive7 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %agg.tmp6, i32 0, i32 0
  %3 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive7, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %3 to i64
  %call8 = call noundef %"class.std::__1::__tree_const_iterator"* @_ZNSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEC1ENS_15__tree_iteratorIiS4_lEE(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %agg.tmp, i64 %coerce.val.pi) #8
  %coerce.dive9 = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %agg.tmp, i32 0, i32 0
  %4 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive9, align 8
  %coerce.val.pi10 = ptrtoint %"class.std::__1::__tree_end_node"* %4 to i64
  %call11 = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE5eraseENS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, i64 %coerce.val.pi10)
  %coerce.dive12 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %coerce, i32 0, i32 0
  %coerce.val.ip13 = inttoptr i64 %call11 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip13, %"class.std::__1::__tree_end_node"** %coerce.dive12, align 8
  store i64 1, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i64, i64* %retval, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define linkonce_odr i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE5eraseENS_21__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, i64 %__p.coerce) #0 align 2 {
entry:
  %retval = alloca %"class.std::__1::__tree_iterator", align 8
  %__p = alloca %"class.std::__1::__tree_const_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__np = alloca %"class.std::__1::__tree_node"*, align 8
  %__na = alloca %"class.std::__1::allocator"*, align 8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_const_iterator", %"class.std::__1::__tree_const_iterator"* %__p, i32 0, i32 0
  %coerce.val.ip = inttoptr i64 %__p.coerce to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node"* @_ZNKSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElE8__get_npEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %__p)
  store %"class.std::__1::__tree_node"* %call, %"class.std::__1::__tree_node"** %__np, align 8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__np, align 8
  %call2 = call i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE21__remove_node_pointerEPNS_11__tree_nodeIiPvEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1, %"class.std::__1::__tree_node"* noundef %0) #8
  %coerce.dive3 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %coerce.val.ip4 = inttoptr i64 %call2 to %"class.std::__1::__tree_end_node"*
  store %"class.std::__1::__tree_end_node"* %coerce.val.ip4, %"class.std::__1::__tree_end_node"** %coerce.dive3, align 8
  %call5 = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__node_allocEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::allocator"* %call5, %"class.std::__1::allocator"** %__na, align 8
  %1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na, align 8
  %call6 = call noundef nonnull align 4 dereferenceable(4) i32* @_ZNKSt3__121__tree_const_iteratorIiPNS_11__tree_nodeIiPvEElEdeEv(%"class.std::__1::__tree_const_iterator"* noundef nonnull align 8 dereferenceable(8) %__p)
  %call7 = call noundef i32* @_ZNSt3__122__tree_key_value_typesIiE9__get_ptrERi(i32* noundef nonnull align 4 dereferenceable(4) %call6)
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE7destroyIivvEEvRS5_PT_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %1, i32* noundef %call7)
  %2 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__na, align 8
  %3 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__np, align 8
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeIiPvEEEEE10deallocateERS5_PS4_m(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %2, %"class.std::__1::__tree_node"* noundef %3, i64 noundef 1) #8
  %coerce.dive8 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %4 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive8, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %4 to i64
  ret i64 %coerce.val.pi
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal i64 @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE21__remove_node_pointerEPNS_11__tree_nodeIiPvEE(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this, %"class.std::__1::__tree_node"* noundef %__ptr) #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %retval = alloca %"class.std::__1::__tree_iterator", align 8
  %this.addr = alloca %"class.std::__1::__tree"*, align 8
  %__ptr.addr = alloca %"class.std::__1::__tree_node"*, align 8
  store %"class.std::__1::__tree"* %this, %"class.std::__1::__tree"** %this.addr, align 8
  store %"class.std::__1::__tree_node"* %__ptr, %"class.std::__1::__tree_node"** %__ptr.addr, align 8
  %this1 = load %"class.std::__1::__tree"*, %"class.std::__1::__tree"** %this.addr, align 8
  %0 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__ptr.addr, align 8
  %call = call noundef %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEC1ES4_(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %retval, %"class.std::__1::__tree_node"* noundef %0) #8
  %call2 = invoke noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEppEv(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %retval)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  %call3 = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %1 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %call3, align 8
  %2 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__ptr.addr, align 8
  %3 = bitcast %"class.std::__1::__tree_node"* %2 to %"class.std::__1::__tree_end_node"*
  %cmp = icmp eq %"class.std::__1::__tree_end_node"* %1, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %invoke.cont
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %4 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_end_node"** @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE12__begin_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  store %"class.std::__1::__tree_end_node"* %4, %"class.std::__1::__tree_end_node"** %call4, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %invoke.cont
  %call5 = call noundef nonnull align 8 dereferenceable(8) i64* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE4sizeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %5 = load i64, i64* %call5, align 8
  %dec = add i64 %5, -1
  store i64 %dec, i64* %call5, align 8
  %call6 = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__16__treeIiNS_4lessIiEENS_9allocatorIiEEE10__end_nodeEv(%"class.std::__1::__tree"* noundef nonnull align 8 dereferenceable(24) %this1) #8
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %call6, i32 0, i32 0
  %6 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %7 = load %"class.std::__1::__tree_node"*, %"class.std::__1::__tree_node"** %__ptr.addr, align 8
  %8 = bitcast %"class.std::__1::__tree_node"* %7 to %"class.std::__1::__tree_node_base"*
  call void @_ZNSt3__113__tree_removeIPNS_16__tree_node_baseIPvEEEEvT_S5_(%"class.std::__1::__tree_node_base"* noundef %6, %"class.std::__1::__tree_node_base"* noundef %8) #8
  %coerce.dive = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %retval, i32 0, i32 0
  %9 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %coerce.dive, align 8
  %coerce.val.pi = ptrtoint %"class.std::__1::__tree_end_node"* %9 to i64
  ret i64 %coerce.val.pi

terminate.lpad:                                   ; preds = %entry
  %10 = landingpad { i8*, i32 }
          catch i8* null
  %11 = extractvalue { i8*, i32 } %10, 0
  call void @__clang_call_terminate(i8* %11) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(8) %"class.std::__1::__tree_iterator"* @_ZNSt3__115__tree_iteratorIiPNS_11__tree_nodeIiPvEElEppEv(%"class.std::__1::__tree_iterator"* noundef nonnull align 8 dereferenceable(8) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__tree_iterator"*, align 8
  store %"class.std::__1::__tree_iterator"* %this, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %this1 = load %"class.std::__1::__tree_iterator"*, %"class.std::__1::__tree_iterator"** %this.addr, align 8
  %__ptr_ = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %this1, i32 0, i32 0
  %0 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__ptr_, align 8
  %1 = bitcast %"class.std::__1::__tree_end_node"* %0 to %"class.std::__1::__tree_node_base"*
  %call = call noundef %"class.std::__1::__tree_end_node"* @_ZNSt3__1L16__tree_next_iterIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEES5_EET_T0_(%"class.std::__1::__tree_node_base"* noundef %1) #8
  %__ptr_2 = getelementptr inbounds %"class.std::__1::__tree_iterator", %"class.std::__1::__tree_iterator"* %this1, i32 0, i32 0
  store %"class.std::__1::__tree_end_node"* %call, %"class.std::__1::__tree_end_node"** %__ptr_2, align 8
  ret %"class.std::__1::__tree_iterator"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNSt3__113__tree_removeIPNS_16__tree_node_baseIPvEEEEvT_S5_(%"class.std::__1::__tree_node_base"* noundef %__root, %"class.std::__1::__tree_node_base"* noundef %__z) #2 {
entry:
  %__root.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__z.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__y = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__x = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__w = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__removed_black = alloca i8, align 1
  store %"class.std::__1::__tree_node_base"* %__root, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  store %"class.std::__1::__tree_node_base"* %__z, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %1 = bitcast %"class.std::__1::__tree_node_base"* %0 to %"class.std::__1::__tree_end_node"*
  %__left_ = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %1, i32 0, i32 0
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_, align 8
  %cmp = icmp eq %"class.std::__1::__tree_node_base"* %2, null
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %3, i32 0, i32 1
  %4 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %cmp1 = icmp eq %"class.std::__1::__tree_node_base"* %4, null
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %6 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %call = call noundef %"class.std::__1::__tree_node_base"* @_ZNSt3__111__tree_nextIPNS_16__tree_node_baseIPvEEEET_S5_(%"class.std::__1::__tree_node_base"* noundef %6) #8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %"class.std::__1::__tree_node_base"* [ %5, %cond.true ], [ %call, %cond.false ]
  store %"class.std::__1::__tree_node_base"* %cond, %"class.std::__1::__tree_node_base"** %__y, align 8
  %7 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %8 = bitcast %"class.std::__1::__tree_node_base"* %7 to %"class.std::__1::__tree_end_node"*
  %__left_2 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %8, i32 0, i32 0
  %9 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_2, align 8
  %cmp3 = icmp ne %"class.std::__1::__tree_node_base"* %9, null
  br i1 %cmp3, label %cond.true4, label %cond.false6

cond.true4:                                       ; preds = %cond.end
  %10 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %11 = bitcast %"class.std::__1::__tree_node_base"* %10 to %"class.std::__1::__tree_end_node"*
  %__left_5 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %11, i32 0, i32 0
  %12 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_5, align 8
  br label %cond.end8

cond.false6:                                      ; preds = %cond.end
  %13 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__right_7 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %13, i32 0, i32 1
  %14 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_7, align 8
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true4
  %cond9 = phi %"class.std::__1::__tree_node_base"* [ %12, %cond.true4 ], [ %14, %cond.false6 ]
  store %"class.std::__1::__tree_node_base"* %cond9, %"class.std::__1::__tree_node_base"** %__x, align 8
  store %"class.std::__1::__tree_node_base"* null, %"class.std::__1::__tree_node_base"** %__w, align 8
  %15 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %cmp10 = icmp ne %"class.std::__1::__tree_node_base"* %15, null
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end8
  %16 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__parent_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %16, i32 0, i32 2
  %17 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_, align 8
  %18 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__parent_11 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %18, i32 0, i32 2
  store %"class.std::__1::__tree_end_node"* %17, %"class.std::__1::__tree_end_node"** %__parent_11, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end8
  %19 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %call12 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %19) #8
  br i1 %call12, label %if.then13, label %if.else21

if.then13:                                        ; preds = %if.end
  %20 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %21 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__parent_14 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %21, i32 0, i32 2
  %22 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_14, align 8
  %__left_15 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %22, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* %20, %"class.std::__1::__tree_node_base"** %__left_15, align 8
  %23 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %24 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp16 = icmp ne %"class.std::__1::__tree_node_base"* %23, %24
  br i1 %cmp16, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.then13
  %25 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %call18 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %25)
  %__right_19 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call18, i32 0, i32 1
  %26 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_19, align 8
  store %"class.std::__1::__tree_node_base"* %26, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end20

if.else:                                          ; preds = %if.then13
  %27 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  store %"class.std::__1::__tree_node_base"* %27, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  br label %if.end26

if.else21:                                        ; preds = %if.end
  %28 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %29 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %call22 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %29)
  %__right_23 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call22, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* %28, %"class.std::__1::__tree_node_base"** %__right_23, align 8
  %30 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__parent_24 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %30, i32 0, i32 2
  %31 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_24, align 8
  %__left_25 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %31, i32 0, i32 0
  %32 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_25, align 8
  store %"class.std::__1::__tree_node_base"* %32, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end26

if.end26:                                         ; preds = %if.else21, %if.end20
  %33 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__is_black_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %33, i32 0, i32 3
  %34 = load i8, i8* %__is_black_, align 8
  %tobool = trunc i8 %34 to i1
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %__removed_black, align 1
  %35 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %36 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %cmp27 = icmp ne %"class.std::__1::__tree_node_base"* %35, %36
  br i1 %cmp27, label %if.then28, label %if.end56

if.then28:                                        ; preds = %if.end26
  %37 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %__parent_29 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %37, i32 0, i32 2
  %38 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_29, align 8
  %39 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__parent_30 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %39, i32 0, i32 2
  store %"class.std::__1::__tree_end_node"* %38, %"class.std::__1::__tree_end_node"** %__parent_30, align 8
  %40 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %call31 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %40) #8
  br i1 %call31, label %if.then32, label %if.else35

if.then32:                                        ; preds = %if.then28
  %41 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %42 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__parent_33 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %42, i32 0, i32 2
  %43 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_33, align 8
  %__left_34 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %43, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* %41, %"class.std::__1::__tree_node_base"** %__left_34, align 8
  br label %if.end38

if.else35:                                        ; preds = %if.then28
  %44 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %45 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %call36 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %45)
  %__right_37 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call36, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* %44, %"class.std::__1::__tree_node_base"** %__right_37, align 8
  br label %if.end38

if.end38:                                         ; preds = %if.else35, %if.then32
  %46 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %47 = bitcast %"class.std::__1::__tree_node_base"* %46 to %"class.std::__1::__tree_end_node"*
  %__left_39 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %47, i32 0, i32 0
  %48 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_39, align 8
  %49 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %50 = bitcast %"class.std::__1::__tree_node_base"* %49 to %"class.std::__1::__tree_end_node"*
  %__left_40 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %50, i32 0, i32 0
  store %"class.std::__1::__tree_node_base"* %48, %"class.std::__1::__tree_node_base"** %__left_40, align 8
  %51 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %52 = bitcast %"class.std::__1::__tree_node_base"* %51 to %"class.std::__1::__tree_end_node"*
  %__left_41 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %52, i32 0, i32 0
  %53 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_41, align 8
  %54 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  call void @_ZNSt3__116__tree_node_baseIPvE12__set_parentEPS2_(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %53, %"class.std::__1::__tree_node_base"* noundef %54)
  %55 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %__right_42 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %55, i32 0, i32 1
  %56 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_42, align 8
  %57 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__right_43 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %57, i32 0, i32 1
  store %"class.std::__1::__tree_node_base"* %56, %"class.std::__1::__tree_node_base"** %__right_43, align 8
  %58 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__right_44 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %58, i32 0, i32 1
  %59 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_44, align 8
  %cmp45 = icmp ne %"class.std::__1::__tree_node_base"* %59, null
  br i1 %cmp45, label %if.then46, label %if.end48

if.then46:                                        ; preds = %if.end38
  %60 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__right_47 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %60, i32 0, i32 1
  %61 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_47, align 8
  %62 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  call void @_ZNSt3__116__tree_node_baseIPvE12__set_parentEPS2_(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %61, %"class.std::__1::__tree_node_base"* noundef %62)
  br label %if.end48

if.end48:                                         ; preds = %if.then46, %if.end38
  %63 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %__is_black_49 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %63, i32 0, i32 3
  %64 = load i8, i8* %__is_black_49, align 8
  %tobool50 = trunc i8 %64 to i1
  %65 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  %__is_black_51 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %65, i32 0, i32 3
  %frombool52 = zext i1 %tobool50 to i8
  store i8 %frombool52, i8* %__is_black_51, align 8
  %66 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %67 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__z.addr, align 8
  %cmp53 = icmp eq %"class.std::__1::__tree_node_base"* %66, %67
  br i1 %cmp53, label %if.then54, label %if.end55

if.then54:                                        ; preds = %if.end48
  %68 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__y, align 8
  store %"class.std::__1::__tree_node_base"* %68, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  br label %if.end55

if.end55:                                         ; preds = %if.then54, %if.end48
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end26
  %69 = load i8, i8* %__removed_black, align 1
  %tobool57 = trunc i8 %69 to i1
  br i1 %tobool57, label %land.lhs.true, label %if.end209

land.lhs.true:                                    ; preds = %if.end56
  %70 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp58 = icmp ne %"class.std::__1::__tree_node_base"* %70, null
  br i1 %cmp58, label %if.then59, label %if.end209

if.then59:                                        ; preds = %land.lhs.true
  %71 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %cmp60 = icmp ne %"class.std::__1::__tree_node_base"* %71, null
  br i1 %cmp60, label %if.then61, label %if.else63

if.then61:                                        ; preds = %if.then59
  %72 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__is_black_62 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %72, i32 0, i32 3
  store i8 1, i8* %__is_black_62, align 8
  br label %if.end208

if.else63:                                        ; preds = %if.then59
  br label %while.cond

while.cond:                                       ; preds = %if.end207, %if.else63
  br label %while.body

while.body:                                       ; preds = %while.cond
  %73 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call64 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %73) #8
  br i1 %call64, label %if.else136, label %if.then65

if.then65:                                        ; preds = %while.body
  %74 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_66 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %74, i32 0, i32 3
  %75 = load i8, i8* %__is_black_66, align 8
  %tobool67 = trunc i8 %75 to i1
  br i1 %tobool67, label %if.end79, label %if.then68

if.then68:                                        ; preds = %if.then65
  %76 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_69 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %76, i32 0, i32 3
  store i8 1, i8* %__is_black_69, align 8
  %77 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call70 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %77)
  %__is_black_71 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call70, i32 0, i32 3
  store i8 0, i8* %__is_black_71, align 8
  %78 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call72 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %78)
  call void @_ZNSt3__118__tree_left_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %call72) #8
  %79 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %80 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %81 = bitcast %"class.std::__1::__tree_node_base"* %80 to %"class.std::__1::__tree_end_node"*
  %__left_73 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %81, i32 0, i32 0
  %82 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_73, align 8
  %cmp74 = icmp eq %"class.std::__1::__tree_node_base"* %79, %82
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.then68
  %83 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  store %"class.std::__1::__tree_node_base"* %83, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.then68
  %84 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %85 = bitcast %"class.std::__1::__tree_node_base"* %84 to %"class.std::__1::__tree_end_node"*
  %__left_77 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %85, i32 0, i32 0
  %86 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_77, align 8
  %__right_78 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %86, i32 0, i32 1
  %87 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_78, align 8
  store %"class.std::__1::__tree_node_base"* %87, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end79

if.end79:                                         ; preds = %if.end76, %if.then65
  %88 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %89 = bitcast %"class.std::__1::__tree_node_base"* %88 to %"class.std::__1::__tree_end_node"*
  %__left_80 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %89, i32 0, i32 0
  %90 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_80, align 8
  %cmp81 = icmp eq %"class.std::__1::__tree_node_base"* %90, null
  br i1 %cmp81, label %land.lhs.true86, label %lor.lhs.false82

lor.lhs.false82:                                  ; preds = %if.end79
  %91 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %92 = bitcast %"class.std::__1::__tree_node_base"* %91 to %"class.std::__1::__tree_end_node"*
  %__left_83 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %92, i32 0, i32 0
  %93 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_83, align 8
  %__is_black_84 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %93, i32 0, i32 3
  %94 = load i8, i8* %__is_black_84, align 8
  %tobool85 = trunc i8 %94 to i1
  br i1 %tobool85, label %land.lhs.true86, label %if.else112

land.lhs.true86:                                  ; preds = %lor.lhs.false82, %if.end79
  %95 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_87 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %95, i32 0, i32 1
  %96 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_87, align 8
  %cmp88 = icmp eq %"class.std::__1::__tree_node_base"* %96, null
  br i1 %cmp88, label %if.then93, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %land.lhs.true86
  %97 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_90 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %97, i32 0, i32 1
  %98 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_90, align 8
  %__is_black_91 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %98, i32 0, i32 3
  %99 = load i8, i8* %__is_black_91, align 8
  %tobool92 = trunc i8 %99 to i1
  br i1 %tobool92, label %if.then93, label %if.else112

if.then93:                                        ; preds = %lor.lhs.false89, %land.lhs.true86
  %100 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_94 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %100, i32 0, i32 3
  store i8 0, i8* %__is_black_94, align 8
  %101 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call95 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %101)
  store %"class.std::__1::__tree_node_base"* %call95, %"class.std::__1::__tree_node_base"** %__x, align 8
  %102 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %103 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp96 = icmp eq %"class.std::__1::__tree_node_base"* %102, %103
  br i1 %cmp96, label %if.then100, label %lor.lhs.false97

lor.lhs.false97:                                  ; preds = %if.then93
  %104 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__is_black_98 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %104, i32 0, i32 3
  %105 = load i8, i8* %__is_black_98, align 8
  %tobool99 = trunc i8 %105 to i1
  br i1 %tobool99, label %if.end102, label %if.then100

if.then100:                                       ; preds = %lor.lhs.false97, %if.then93
  %106 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__is_black_101 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %106, i32 0, i32 3
  store i8 1, i8* %__is_black_101, align 8
  br label %while.end

if.end102:                                        ; preds = %lor.lhs.false97
  %107 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %call103 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %107) #8
  br i1 %call103, label %cond.true104, label %cond.false107

cond.true104:                                     ; preds = %if.end102
  %108 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %call105 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %108)
  %__right_106 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call105, i32 0, i32 1
  %109 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_106, align 8
  br label %cond.end110

cond.false107:                                    ; preds = %if.end102
  %110 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__parent_108 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %110, i32 0, i32 2
  %111 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_108, align 8
  %__left_109 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %111, i32 0, i32 0
  %112 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_109, align 8
  br label %cond.end110

cond.end110:                                      ; preds = %cond.false107, %cond.true104
  %cond111 = phi %"class.std::__1::__tree_node_base"* [ %109, %cond.true104 ], [ %112, %cond.false107 ]
  store %"class.std::__1::__tree_node_base"* %cond111, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end135

if.else112:                                       ; preds = %lor.lhs.false89, %lor.lhs.false82
  %113 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_113 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %113, i32 0, i32 1
  %114 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_113, align 8
  %cmp114 = icmp eq %"class.std::__1::__tree_node_base"* %114, null
  br i1 %cmp114, label %if.then119, label %lor.lhs.false115

lor.lhs.false115:                                 ; preds = %if.else112
  %115 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_116 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %115, i32 0, i32 1
  %116 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_116, align 8
  %__is_black_117 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %116, i32 0, i32 3
  %117 = load i8, i8* %__is_black_117, align 8
  %tobool118 = trunc i8 %117 to i1
  br i1 %tobool118, label %if.then119, label %if.end124

if.then119:                                       ; preds = %lor.lhs.false115, %if.else112
  %118 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %119 = bitcast %"class.std::__1::__tree_node_base"* %118 to %"class.std::__1::__tree_end_node"*
  %__left_120 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %119, i32 0, i32 0
  %120 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_120, align 8
  %__is_black_121 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %120, i32 0, i32 3
  store i8 1, i8* %__is_black_121, align 8
  %121 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_122 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %121, i32 0, i32 3
  store i8 0, i8* %__is_black_122, align 8
  %122 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  call void @_ZNSt3__119__tree_right_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %122) #8
  %123 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call123 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %123)
  store %"class.std::__1::__tree_node_base"* %call123, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end124

if.end124:                                        ; preds = %if.then119, %lor.lhs.false115
  %124 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call125 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %124)
  %__is_black_126 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call125, i32 0, i32 3
  %125 = load i8, i8* %__is_black_126, align 8
  %tobool127 = trunc i8 %125 to i1
  %126 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_128 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %126, i32 0, i32 3
  %frombool129 = zext i1 %tobool127 to i8
  store i8 %frombool129, i8* %__is_black_128, align 8
  %127 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call130 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %127)
  %__is_black_131 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call130, i32 0, i32 3
  store i8 1, i8* %__is_black_131, align 8
  %128 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_132 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %128, i32 0, i32 1
  %129 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_132, align 8
  %__is_black_133 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %129, i32 0, i32 3
  store i8 1, i8* %__is_black_133, align 8
  %130 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call134 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %130)
  call void @_ZNSt3__118__tree_left_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %call134) #8
  br label %while.end

if.end135:                                        ; preds = %cond.end110
  br label %if.end207

if.else136:                                       ; preds = %while.body
  %131 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_137 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %131, i32 0, i32 3
  %132 = load i8, i8* %__is_black_137, align 8
  %tobool138 = trunc i8 %132 to i1
  br i1 %tobool138, label %if.end150, label %if.then139

if.then139:                                       ; preds = %if.else136
  %133 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_140 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %133, i32 0, i32 3
  store i8 1, i8* %__is_black_140, align 8
  %134 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call141 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %134)
  %__is_black_142 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call141, i32 0, i32 3
  store i8 0, i8* %__is_black_142, align 8
  %135 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call143 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %135)
  call void @_ZNSt3__119__tree_right_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %call143) #8
  %136 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %137 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_144 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %137, i32 0, i32 1
  %138 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_144, align 8
  %cmp145 = icmp eq %"class.std::__1::__tree_node_base"* %136, %138
  br i1 %cmp145, label %if.then146, label %if.end147

if.then146:                                       ; preds = %if.then139
  %139 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  store %"class.std::__1::__tree_node_base"* %139, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %if.then139
  %140 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_148 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %140, i32 0, i32 1
  %141 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_148, align 8
  %142 = bitcast %"class.std::__1::__tree_node_base"* %141 to %"class.std::__1::__tree_end_node"*
  %__left_149 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %142, i32 0, i32 0
  %143 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_149, align 8
  store %"class.std::__1::__tree_node_base"* %143, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end150

if.end150:                                        ; preds = %if.end147, %if.else136
  %144 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %145 = bitcast %"class.std::__1::__tree_node_base"* %144 to %"class.std::__1::__tree_end_node"*
  %__left_151 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %145, i32 0, i32 0
  %146 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_151, align 8
  %cmp152 = icmp eq %"class.std::__1::__tree_node_base"* %146, null
  br i1 %cmp152, label %land.lhs.true157, label %lor.lhs.false153

lor.lhs.false153:                                 ; preds = %if.end150
  %147 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %148 = bitcast %"class.std::__1::__tree_node_base"* %147 to %"class.std::__1::__tree_end_node"*
  %__left_154 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %148, i32 0, i32 0
  %149 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_154, align 8
  %__is_black_155 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %149, i32 0, i32 3
  %150 = load i8, i8* %__is_black_155, align 8
  %tobool156 = trunc i8 %150 to i1
  br i1 %tobool156, label %land.lhs.true157, label %if.else183

land.lhs.true157:                                 ; preds = %lor.lhs.false153, %if.end150
  %151 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_158 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %151, i32 0, i32 1
  %152 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_158, align 8
  %cmp159 = icmp eq %"class.std::__1::__tree_node_base"* %152, null
  br i1 %cmp159, label %if.then164, label %lor.lhs.false160

lor.lhs.false160:                                 ; preds = %land.lhs.true157
  %153 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_161 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %153, i32 0, i32 1
  %154 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_161, align 8
  %__is_black_162 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %154, i32 0, i32 3
  %155 = load i8, i8* %__is_black_162, align 8
  %tobool163 = trunc i8 %155 to i1
  br i1 %tobool163, label %if.then164, label %if.else183

if.then164:                                       ; preds = %lor.lhs.false160, %land.lhs.true157
  %156 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_165 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %156, i32 0, i32 3
  store i8 0, i8* %__is_black_165, align 8
  %157 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call166 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %157)
  store %"class.std::__1::__tree_node_base"* %call166, %"class.std::__1::__tree_node_base"** %__x, align 8
  %158 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__is_black_167 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %158, i32 0, i32 3
  %159 = load i8, i8* %__is_black_167, align 8
  %tobool168 = trunc i8 %159 to i1
  br i1 %tobool168, label %lor.lhs.false169, label %if.then171

lor.lhs.false169:                                 ; preds = %if.then164
  %160 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %161 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__root.addr, align 8
  %cmp170 = icmp eq %"class.std::__1::__tree_node_base"* %160, %161
  br i1 %cmp170, label %if.then171, label %if.end173

if.then171:                                       ; preds = %lor.lhs.false169, %if.then164
  %162 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__is_black_172 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %162, i32 0, i32 3
  store i8 1, i8* %__is_black_172, align 8
  br label %while.end

if.end173:                                        ; preds = %lor.lhs.false169
  %163 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %call174 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %163) #8
  br i1 %call174, label %cond.true175, label %cond.false178

cond.true175:                                     ; preds = %if.end173
  %164 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %call176 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %164)
  %__right_177 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call176, i32 0, i32 1
  %165 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_177, align 8
  br label %cond.end181

cond.false178:                                    ; preds = %if.end173
  %166 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x, align 8
  %__parent_179 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %166, i32 0, i32 2
  %167 = load %"class.std::__1::__tree_end_node"*, %"class.std::__1::__tree_end_node"** %__parent_179, align 8
  %__left_180 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %167, i32 0, i32 0
  %168 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_180, align 8
  br label %cond.end181

cond.end181:                                      ; preds = %cond.false178, %cond.true175
  %cond182 = phi %"class.std::__1::__tree_node_base"* [ %165, %cond.true175 ], [ %168, %cond.false178 ]
  store %"class.std::__1::__tree_node_base"* %cond182, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end206

if.else183:                                       ; preds = %lor.lhs.false160, %lor.lhs.false153
  %169 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %170 = bitcast %"class.std::__1::__tree_node_base"* %169 to %"class.std::__1::__tree_end_node"*
  %__left_184 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %170, i32 0, i32 0
  %171 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_184, align 8
  %cmp185 = icmp eq %"class.std::__1::__tree_node_base"* %171, null
  br i1 %cmp185, label %if.then190, label %lor.lhs.false186

lor.lhs.false186:                                 ; preds = %if.else183
  %172 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %173 = bitcast %"class.std::__1::__tree_node_base"* %172 to %"class.std::__1::__tree_end_node"*
  %__left_187 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %173, i32 0, i32 0
  %174 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_187, align 8
  %__is_black_188 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %174, i32 0, i32 3
  %175 = load i8, i8* %__is_black_188, align 8
  %tobool189 = trunc i8 %175 to i1
  br i1 %tobool189, label %if.then190, label %if.end195

if.then190:                                       ; preds = %lor.lhs.false186, %if.else183
  %176 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__right_191 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %176, i32 0, i32 1
  %177 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_191, align 8
  %__is_black_192 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %177, i32 0, i32 3
  store i8 1, i8* %__is_black_192, align 8
  %178 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_193 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %178, i32 0, i32 3
  store i8 0, i8* %__is_black_193, align 8
  %179 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  call void @_ZNSt3__118__tree_left_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %179) #8
  %180 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call194 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %180)
  store %"class.std::__1::__tree_node_base"* %call194, %"class.std::__1::__tree_node_base"** %__w, align 8
  br label %if.end195

if.end195:                                        ; preds = %if.then190, %lor.lhs.false186
  %181 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call196 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %181)
  %__is_black_197 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call196, i32 0, i32 3
  %182 = load i8, i8* %__is_black_197, align 8
  %tobool198 = trunc i8 %182 to i1
  %183 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %__is_black_199 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %183, i32 0, i32 3
  %frombool200 = zext i1 %tobool198 to i8
  store i8 %frombool200, i8* %__is_black_199, align 8
  %184 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call201 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %184)
  %__is_black_202 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %call201, i32 0, i32 3
  store i8 1, i8* %__is_black_202, align 8
  %185 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %186 = bitcast %"class.std::__1::__tree_node_base"* %185 to %"class.std::__1::__tree_end_node"*
  %__left_203 = getelementptr inbounds %"class.std::__1::__tree_end_node", %"class.std::__1::__tree_end_node"* %186, i32 0, i32 0
  %187 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__left_203, align 8
  %__is_black_204 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %187, i32 0, i32 3
  store i8 1, i8* %__is_black_204, align 8
  %188 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__w, align 8
  %call205 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %188)
  call void @_ZNSt3__119__tree_right_rotateIPNS_16__tree_node_baseIPvEEEEvT_(%"class.std::__1::__tree_node_base"* noundef %call205) #8
  br label %while.end

if.end206:                                        ; preds = %cond.end181
  br label %if.end207

if.end207:                                        ; preds = %if.end206, %if.end135
  br label %while.cond, !llvm.loop !19

while.end:                                        ; preds = %if.end195, %if.then171, %if.end124, %if.then100
  br label %if.end208

if.end208:                                        ; preds = %while.end, %if.then61
  br label %if.end209

if.end209:                                        ; preds = %if.end208, %land.lhs.true, %if.end56
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr noundef %"class.std::__1::__tree_node_base"* @_ZNSt3__111__tree_nextIPNS_16__tree_node_baseIPvEEEET_S5_(%"class.std::__1::__tree_node_base"* noundef %__x) #2 {
entry:
  %retval = alloca %"class.std::__1::__tree_node_base"*, align 8
  %__x.addr = alloca %"class.std::__1::__tree_node_base"*, align 8
  store %"class.std::__1::__tree_node_base"* %__x, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %0 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_ = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %0, i32 0, i32 1
  %1 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_, align 8
  %cmp = icmp ne %"class.std::__1::__tree_node_base"* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %__right_1 = getelementptr inbounds %"class.std::__1::__tree_node_base", %"class.std::__1::__tree_node_base"* %2, i32 0, i32 1
  %3 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__right_1, align 8
  %call = call noundef %"class.std::__1::__tree_node_base"* @_ZNSt3__1L10__tree_minIPNS_16__tree_node_baseIPvEEEET_S5_(%"class.std::__1::__tree_node_base"* noundef %3) #8
  store %"class.std::__1::__tree_node_base"* %call, %"class.std::__1::__tree_node_base"** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %4 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call2 = call noundef zeroext i1 @_ZNSt3__1L20__tree_is_left_childIPNS_16__tree_node_baseIPvEEEEbT_(%"class.std::__1::__tree_node_base"* noundef %4) #8
  %lnot = xor i1 %call2, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call3 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %5)
  store %"class.std::__1::__tree_node_base"* %call3, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  br label %while.cond, !llvm.loop !20

while.end:                                        ; preds = %while.cond
  %6 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %__x.addr, align 8
  %call4 = call noundef %"class.std::__1::__tree_node_base"* @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeEv(%"class.std::__1::__tree_node_base"* noundef nonnull align 8 dereferenceable(25) %6)
  store %"class.std::__1::__tree_node_base"* %call4, %"class.std::__1::__tree_node_base"** %retval, align 8
  br label %return

return:                                           ; preds = %while.end, %if.then
  %7 = load %"class.std::__1::__tree_node_base"*, %"class.std::__1::__tree_node_base"** %retval, align 8
  ret %"class.std::__1::__tree_node_base"* %7
}

; Function Attrs: noinline ssp uwtable
define internal void @_GLOBAL__sub_I_server.cpp() #6 section "__TEXT,__StaticInit,regular,pure_instructions" {
entry:
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { mustprogress noinline optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #1 = { convergent nofree nosync nounwind readnone willreturn }
attributes #2 = { mustprogress noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { cold "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #6 = { noinline ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #7 = { noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #8 = { nounwind }
attributes #9 = { argmemonly nofree nounwind willreturn writeonly }
attributes #10 = { mustprogress noinline norecurse optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #11 = { noinline optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #12 = { noinline noreturn nounwind }
attributes #13 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #14 = { mustprogress noinline noreturn optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #15 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #16 = { nobuiltin allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #17 = { cold }
attributes #18 = { noreturn nounwind }
attributes #19 = { builtin nounwind }
attributes #20 = { noreturn }
attributes #21 = { builtin allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 13, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"branch-target-enforcement", i32 0}
!3 = !{i32 1, !"sign-return-address", i32 0}
!4 = !{i32 1, !"sign-return-address-all", i32 0}
!5 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
