<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${msg}');
	opener.document.memJoin_fm.mem_email.value='${email }';
	window.self.close();
</script>