<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.workTab {
	margin: 7px 0 0 0;
	display: inline-block;
	height: 32px;
	overflow: hidden;
}

.workTab button {
	display: inline-block;
	vertical-align: top;
	margin-left: -1px;
	width: 71px;
	height: 32px;
	font-size: 14px;
	color: #969696;
	text-align: center;
	background-color: #fff;
	border: 1px solid #f0f1f3;
}

.workTab button.tab1 {
	border-radius: 4px 0 0 4px;
	margin-left: 0;
}

.workTab button.tab4 {
	border-radius: 0 4px 4px 0;
}

.workTab button.on {
	font-weight: 700;
	color: #fff;
	background-color: #e56060;
	border: 1px solid #e56060;
}

.workTab button.tab1.on {
	background-color: #4aaefb;
	border: 1px solid #4aaefb;
}

.workTab button.tab2.on {
	background-color: #50b766;
	border: 1px solid #50b766;
}

.workTab button.tab3.on {
	background-color: #2e417e;
	border: 1px solid #2e417e;
}

.workTab button.tab4.on {
	background-color: #aeaeae;
	border: 1px solid #aeaeae;
}

.workTab button.tab5.on {
	background-color: #f17a19;
	border: 1px solid #f17a19;
}

.blind {
	visibility: hidden;
	text-indent: -9999999px;
	font-size: 0;
	height: 0;
	line-height: 0;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="post-cntn-area">
		<div id="task-layer" class="pst_write_bx">
			<div id="task-props" class="workwriteWrap" style="min-height: 200px;">
				<!-- 업무명 -->
				<div class="titleBx">
					<input name="TASK_NM" style="display: block;" type="text"
						maxlength="50" placeholder="업무명을 입력하세요" autocomplete="off"
						data-langcode="CD802"> <span class="titleReadOnly"
						id="TASK_NM_READ_ONLY" style="padding-left: 0px; display: none;">
						<!-- [D] 20190121 display: inline -> display: inline-block 으로 사용 부탁드립니다. -->
					</span> <span class="num" id="TASK_SRNO" style="display: none;"> <!-- [D] 20190121 display: inline -> display: inline-block 으로 사용 부탁드립니다. --></span>
				</div>


				<a id="GO_WORK_FLOW" class="goWorkFlow" style="display: none;"
					data-langcode="CD757">이곳을 클릭하여 해당 글로 이동할 수 있습니다.</a>
				<!-- 업무내용 -->
				<div class="workwriteCont line-fold">
					<!-- line1 -->
					<div class="line" id="STATUS_LINE">
						<label class="icon1"> <span class="blind"
							data-langcode="CD804">상태</span>
						</label>
						<div class="workTab">
							<button class="tab1 on" stts-value="0" data-langcode="CD721">요청</button>
							<button class="tab2" style="margin-left: -5px;" stts-value="1"
								data-langcode="CD722">진행</button>
							<button class="tab5" style="margin-left: -5px;" stts-value="4"
								data-langcode="CD723">피드백</button>
							<button class="tab3" style="margin-left: -5px;" stts-value="2"
								data-langcode="CD724">완료</button>
							<button class="tab4" style="margin-left: -5px;" stts-value="3"
								data-langcode="CD725">보류</button>
						</div>
					</div>
					<!-- line2 -->
					<!-- 담당자:s -->
					<div class="input-box martop-15" style="height: inherit">
						<dl>
							<dt class="maright-20">
								<i class="fas fa-user-plus"></i>
							</dt>
							<dd class="posi-re">

								<!-- 담당자 리스트 -->
								<div class="task-user-list">
									<c:if test="${timeLine.tuList.size()== 0 }">
										<p class="mar-0 pad-0">담당자 없음</p>
									</c:if>
									<c:forEach items="${timeLine.tuList }" var="tuVo">
										<div class="name-tag">
											<img src="/mem/pic?mem_id=${tuVo.tu_mem_id }"
												onerror="this.src='/image/user-pic-sample.png'" width="24">
											<strong class="marleft-10">${tuVo.mem_nick }</strong> <i
												class="fas fa-times-circle marleft-15" style="display: none"></i>
											<input type="hidden" name="tu_mem_id"
												value="${tuVo.tu_mem_id }">
										</div>
									</c:forEach>
								</div>
							</dd>
						</dl>
					</div>
					<!-- 담당자:f -->
					<!-- line3 -->
					<div class="line" id="START_DT_LINE">
						<label class="icon3"> <span class="blind"
							data-langcode="CC667">시작일</span>
						</label>
						<div class="workdate" style="display: block;">
							<input class="START_DT hasDatepicker" start_dt="" type="text"
								placeholder="시작일시 추가" autocomplete="off" data-langcode="CD1832"
								readonly="" id="dp1611819578961"> <span
								class="virtual-date" style="display: none"></span>
							<button id="START_DT_DEL" style="display: none;"
								class="workdateDel">
								<span class="blind" data-langcode="H381">삭제</span>
							</button>
							<span id="START_DT_CNTN" class="c_red" style="display: none;"
								data-langcode="CD810">시작일이 마감일보다 이후 날짜로 되어 있습니다.</span>
						</div>
					</div>
					<!-- line4 -->
					<div class="line" id="END_DT_LINE">
						<label class="icon4"> <span class="blind"
							data-langcode="CD811">마감일</span>
						</label>
						<div class="workdate" style="display: block;">
							<input class="END_DT hasDatepicker" end_dt="" type="text"
								placeholder="마감일시 추가" autocomplete="off" data-langcode="CD812"
								readonly="" id="dp1611819578962"> <span
								class="virtual-date" style="display: none"></span>
							<button id="END_DT_DEL" style="display: none;"
								class="workdateDel">
								<span class="blind" data-langcode="H381">삭제</span>
							</button>
							<span id="END_DT_CNTN" class="c_red" style="display: none;"
								data-langcode="CD813">마감일이 시작일 이전 날짜로 되어 있습니다.</span> <span
								id="END_DT_OVERDUE" class="c_red" style="display: none;"
								data-langcode="CD814">마감기한이 지났습니다.</span>
						</div>
					</div>
					<!-- line5 -->
					<!-- start -->
					<div id="end-time-pick-item" class="time-pick-info end-time-pick"
						style="display: none;">
						<i class="ico-clock"></i> <a role="button" class="time-add">시작시간
							추가</a>
						<div class="time-pick">
							<span class="time">00:00</span> <span class="time-from-to"
								data-langcode="DCS409">부터</span> <a role="button"
								class="time-set-cancle"></a>
							<ul class="time-pick-list"></ul>
						</div>
						<a role="button" class="time-pick-apply">적용</a>
					</div>
					<!-- end -->
					<div class="line" id="PROGRESS_LINE">
						<label class="icon5"> <span class="blind"
							data-langcode="CD815">진척도</span>
						</label> <a class="workPrgrs">
							<div class="workPrgrs_bg">
								<!-- 20170407 수정 -->
								<strong id="PROGRESS_PER" class="txt"></strong> <span
									id="PROGRESS" class="bar percent0"></span>
								<div class="pcnt0" data="0" style="width: 5%; display: block">
									<span class="pcnt">
										<button>0%</button>
									</span>
								</div>
								<div class="pcnt20" data="20" style="left: 5%;">
									<span class="pcnt">
										<button>20%</button>
									</span>
								</div>
								<div class="pcnt40" data="40">
									<span class="pcnt">
										<button>40%</button>
									</span>
								</div>
								<div class="pcnt60" data="60">
									<span class="pcnt">
										<button>60%</button>
									</span>
								</div>
								<div class="pcnt80" data="80">
									<span class="pcnt">
										<button>80%</button>
									</span>
								</div>
								<div class="pcnt100" data="100">
									<span class="pcnt">
										<button>100%</button>
									</span>
								</div>
							</div> <!-- 20170407 수정 -->
						</a>
					</div>

					<!-- line6 -->
					<div class="line" id="PRIORITY_LINE">
						<label class="icon6"> <span class="blind"
							data-langcode="CD816">우선순위</span>
						</label>
						<div class="imptc">
							<input type="text" name="imptcInput" placeholder="우선순위 선택"
								style="display: block;" data-langcode="CD817"> <span
								id="PRIORITY" class="lv1" style="display: none;">낮음</span>
							<button id="PRIORITY_DEL"
								style="margin-left: -1px; display: none;" class="workdateDel">
								<span class="blind" data-langcode="H381">삭제</span>
							</button>
							<!-- level layerpopup -->
							<div id="PRIORITY_LAYER" class="imptc_ly" style="display: none;">
								<ul>
									<li>
										<button class="lv1" data="0" data-langcode="CD818">낮음</button>
									</li>
									<li>
										<button class="lv2" data="1" data-langcode="CD820">보통</button>
									</li>
									<li>
										<button class="lv3" data="2" data-langcode="CD821">높음</button>
									</li>
									<li>
										<button class="lv4" data="3" data-langcode="CD822">긴급</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<button class="workmore" data-langcode="CD823">항목 추가 입력</button>
					<div id="task-cntn" class="editable pst_txt" contenteditable="true"
						spellcheck="false"
						style="margin-top: 30px; min-height: 80px; white-space: pre-wrap; color: #000;"></div>
					<div id="task-cntn-attached">
						<div id="">
							<!-- URL -->
							<div id="url-preview" style="display: none;"></div>
							<div style="display: none;">
								<div class="component preview-li-obj" id="url-preview-li-obj"
									style="cursor: pointer; margin: 10px 0;">
									<a title="삭제" id="remove" class="icon-focused-delete"></a>
									<div class="url_bx comp-url">
										<div class="url_title">
											<strong id="title"></strong>
											<p id="description"></p>
										</div>
										<div class="url_pic">
											<img src="" alt="">
										</div>
										<div class="url_video" style="display: none;">
											<iframe width="642" height="440"
												style="border: none; width: 100%;"></iframe>
										</div>
									</div>
								</div>
							</div>
							<!-- //URL -->
							<!-- 사진 -->
							<div class="photo_loll_wrap" name="COLABO_IMG_BOX"
								style="margin-top: 0; display: none;">
								<div class="photo_loll_fix" style="min-height: 0px;">
									<ul name="COLABO_PIC_UL" id="images"></ul>
								</div>
								<ul style="display: none;">
									<li id="image-li-obj" class="file new_atch" name="PIC_LI">
										<div style="overflow: hidden;">
											<img id="thumbnail" src="" alt="1">
										</div> <input type="hidden" id="P_RAND_KEY" name="P_RAND_KEY"
										value=""> <input type="hidden" id="P_INFO"
										name="P_INFO" value=""> <a id="remove" class="btn_del"
										title="삭제"></a>
									</li>
								</ul>
							</div>
							<!-- //사진 -->
							<!-- 파일 -->
							<div id="files" name="COLABO_FILE_BOX" style="display: none;"></div>
							<div style="display: none;">
								<div class="component" id="file-li-obj" style="margin: 10px 0;">
									<div class="comp-file" style="cursor: default">
										<a id="remove" class="btn_del"></a>
										<div class="filedown_bx">
											<div class="attachfile new_atch" name="ATCH_LI">
												<img id="file-icon"
													src="/design3/img_rn/ico/file_icon_PDF.png" alt=""> <em
													class="doc_drm" style="display: none;"></em>
												<dl>
													<dt>
														<a id="file-name"></a>
													</dt>
													<dd id="file-size"></dd>
												</dl>
												<input type="hidden" id="F_RAND_KEY" name="F_RAND_KEY"
													value=""> <input type="hidden" id="F_INFO"
													name="F_INFO" value="">
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- //파일 -->
						</div>
					</div>
					<div class="subtask-space"></div>
				</div>
			</div>
			<div class="red_ttip_ly" id="postTtipTask" style="display: none;">
				<div class="po">
					<span class="tail"></span>
					<p class="txt_r" data-langcode="CD802">업무명을 입력하세요.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>