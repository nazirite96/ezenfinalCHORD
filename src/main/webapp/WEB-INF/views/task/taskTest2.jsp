<!-- 업무:s -->
<div id="tab-2" class="tabs-content con-task">
	<form action="insertTimWithTask.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="mem_no" value="${memNo }">
		<input type="hidden" name="pro_no" value="${proUserDTO.pro_no }"> 
		<input type="hidden" name="cont_kind" value="task">
		<div class="tab-con-box">
			<!-- 업무명 s -->
			<div class="input-box">
				<input type="text" name="tim_cont" placeholder="업무명을 입력하세요."
					required="required">
			</div>
			<!-- 업무명 e -->
			<!-- dl : 용어를 설명하는 목록 dt : 용어의 제목 
		 dd : 용어를 설명 -->
			<!-- 업무상태 s -->
			<div class="input-box martop-15">
				<dl>
					<dt class="maright-20">
						<i class="fas fa-user-clock"></i>
					</dt>
					<dd>
						<div class="task-state-list">
							<label class="checked" onchange="fn_checkTaskState(this)">
								요청<input type="radio" name="task_state" value="요청"
								class="dis-none" checked>
							</label> <label onchange="fn_checkTaskState(this)"> 진행<input
								type="radio" name="task_state" value="진행" class="dis-none">
							</label> <label onchange="fn_checkTaskState(this)"> 피드백<input
								type="radio" name="task_state" value="피드백" class="dis-none">
							</label> <label onchange="fn_checkTaskState(this)"> 완료<input
								type="radio" name="task_state" value="완료" class="dis-none">
							</label> <label onchange="fn_checkTaskState(this)"> 보류<input
								type="radio" name="task_state" value="보류" class="dis-none">
							</label>
						</div>
					</dd>
				</dl>
			</div>

			<!-- 담당자 s -->
			<div class="input-box martop-15" style="height: inherit">
				<dl>
					<dt class="maright-20">
						<i class="fas fa-user-plus"></i>
					</dt>
					<dd class="posi-re">
						<!-- 담당자 추가 input -->
						<input type="text" id="tu_mem_id" placeholder="담당자 추가"
							onfocus="fn_taskManagerFocus(this)" />
						<!-- 담당자 리스트 -->
						<div class="task-user-list"></div>

						<!-- 프로젝트 참여자 리스트(담당자 설정 리스트) s -->
						<div class="pro-user-list">
							<c:forEach items="${invitedProUserList }" var="proUserDTO">
								<div class="pro-user-info" onclick="fn_taskManagerSelect(this)">
									<div class="pro-user-photo maright-10">
										<i class="icon-circle circle-s"></i> <img
											src="/chord/resources/img/user-pic-sample.png" width="40">
									</div>
									<span class="user-no" data-no="${proUserDTO.mem_no }">${proUserDTO.mem_no }번호
										이름</span>
								</div>
							</c:forEach>
						</div>
						<!-- 프로젝트 참여자 리스트(담당자 설정 리스트) e -->
					</dd>
				</dl>
			</div>
			<!-- 담당자 e -->

			<!-- 시작일 s -->
			<div class="input-box martop-15 add-item-box">
				<dl>
					<dt class="maright-20">
						<i class="far fa-calendar-plus"></i>
					</dt>
					<dd class="posi-re">
						<input type="text" name="task_start_date" placeholder="시작일설정"
							id="datepicker1" class="datepicker-here" data-timepicker="true"
							data-time-format='hh:ii' readonly>
					</dd>
				</dl>
			</div>
			<!-- 시작일 e -->

			<!-- 마감일 s -->
			<div class="input-box martop-15 add-item-box">
				<dl>
					<dt class="maright-20">
						<i class="far fa-calendar-minus"></i>
					</dt>
					<dd class="posi-re">
						<input type="text" name="task_end_date" placeholder="마감일설정"
							id="datepicker2" class="datepicker-here" data-timepicker="true"
							data-time-format='hh:ii' readonly>
					</dd>
				</dl>
			</div>
			<!-- 마감일 e -->

			<!-- 우선순위 s -->
			<div class="input-box martop-15 add-item-box">
				<dl>
					<dt class="maright-20">
						<i class="far fa-flag"></i>
					</dt>
					<dd class="posi-re">
						<input type="text" name="task_priority" class="task-rank-input"
						placeholder="우선순위 선택" onfocus="fn_taskRankFocus(this)" readonly="readonly"> 
						<span class="task-rank"	onclick="fn_taskRankClick(this)"></span>


						<!-- 우선순위 리스트(우선순위 설정 리스트) s -->
						<ul class="task-rank-list">
							<li onclick="fn_taskRankSelect(this)"><i
								class="flow-icon rank-icon icon-low"></i>낮음</li>
							<li onclick="fn_taskRankSelect(this)"><i
								class="flow-icon rank-icon icon-basic"></i>보통</li>
							<li onclick="fn_taskRankSelect(this)"><i
								class="flow-icon rank-icon icon-high"></i>높음</li>
							<li onclick="fn_taskRankSelect(this)"><i
								class="flow-icon rank-icon icon-emer"></i>긴급</li>
						</ul>

						<!-- 우선순위 리스트(우선순위 설정 리스트) e -->
					</dd>
				</dl>
			</div>
			<!-- 우선순위 e -->

			<!-- 추가 항목입력 버튼 -->
			<button type="button" class="add-item-btn" onclick="fn_addItem(this)">
				<i class="fas fa-angle-down maright-10"></i> 추가 항목 입력
			</button>
			<!-- 글 ${fn.trim(dto.content)}-->
			<textArea rows="5" cols="" name="task_content" class="autosize"
				onkeyup="resize(this)" placeholder="글을 작성하세요."></textArea>

			<!-- 이미지 목록 나올부분 -->
			<div class="upload-img-list"></div>

			<!-- 첨부파일 목록 나올부분 -->
			<div class="upload-file-list"></div>
		</div>
		<!-- 본문부분 끝 -->

		<!-- file icon, img icon, 올리기 버튼 있는 부분 -->
		<div class="tab-dn-box">
			<!-- 파일첨부 -->
			<label class="articleFileTask"
				class="float-left maright-20 marbtm-0 font-thin size-18"> <i
				class="fas fa-paperclip maright-10"></i>파일첨부
			</label> <input type="file" id="articleFileTask" name="articleFile"
				class="dis-none">

			<!-- 올리기 버튼 -->
			<input type="submit" value="올리기"
				class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
		</div>
	</form>

</div>
<!-- 업무:f -->