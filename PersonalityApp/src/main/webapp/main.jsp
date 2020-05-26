<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/user_info.css"> --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/user.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	
	
	
	<link href='./assets/demo-to-codepen.css' rel='stylesheet' />
	<link
		href='https://unpkg.com/fullcalendar@3.10.2/dist/fullcalendar.min.css'
		rel='stylesheet' />
	<link
		href='https://unpkg.com/fullcalendar@3.10.2/dist/fullcalendar.print.css'
		rel='stylesheet' media='print' />
	<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css'
		rel='stylesheet'>
	<link
		href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
		rel='stylesheet' />
	<script src='https://unpkg.com/moment@2.25.3/min/moment.min.js'></script>
	<script src='https://unpkg.com/jquery@3.5.1/dist/jquery.min.js'></script>
	<!-- <script
		src='https://unpkg.com/fullcalendar@3.10.2/dist/fullcalendar.min.js'></script> -->
	<script src='./assets/demo-to-codepen.js'></script>
	
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ユーザー情報画面</title>
</head>
<body>
	<%@ include file="./common/header.jsp" %>
	
	<div id='calendar' class="fc fc-bootstrap4">
	<a href="./diary/list">Diary</a>
		<div class="fc-toolbar fc-header-toolbar">
			<div class="fc-left">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" id="btn_prev" aria-label="前"><i class="fas fa-chevron-left"></i></button>
					<button type="button" class="btn btn-primary" id="btn_next" aria-label="次"><i class="fa fa-chevron-right"></i></button>
				</div>
				<button type="button" class="btn btn-primary" id="btn_today">今日</button>
			</div>
			<div class="fc-right">
				<div class="btn-group">
					<button type="button"
						class="btn btn-primary active" id="btn_month">月</button>
					<button type="button" class="btn btn-primary" id="btn_week">週</button>
					<button type="button" class="btn btn-primary" id="btn_date">日</button>
					<button type="button" class="btn btn-primary" id="btn_listmonth">一覧</button>
				</div>
			</div>
			<div class="fc-center"><h2>2020年5月</h2></div>
		</div>
		<div class="fc-view-container" style="">
			<div class="fc-view fc-month-view fc-basic-view" style="">
				<table class="table-bordered">
					<thead class="fc-head">
						<tr>
							<td class="fc-head-container "><div
									class="fc-row table-bordered">
									<table class="table-bordered">
										<thead>
											<tr>
												<th class="fc-week-number " style="width: 18.5px;"><span>W</span></th>
												<th class="fc-day-header  fc-sun"><span>Sun</span></th>
												<th class="fc-day-header  fc-mon"><span>Mon</span></th>
												<th class="fc-day-header  fc-tue"><span>Tue</span></th>
												<th class="fc-day-header  fc-wed"><span>Wed</span></th>
												<th class="fc-day-header  fc-thu"><span>Thu</span></th>
												<th class="fc-day-header  fc-fri"><span>Fri</span></th>
												<th class="fc-day-header  fc-sat"><span>Sat</span></th>
											</tr>
										</thead>
									</table>
								</div></td>
						</tr>
					</thead>
					<tbody class="fc-body">
						<tr>
							<td class=""><div class="fc-scroller fc-day-grid-container"
									style="overflow: hidden; height: 642px;">
									<div class="fc-day-grid fc-unselectable">
										<div class="fc-row fc-week table-bordered fc-rigid"
											style="height: 107px;">
											<div class="fc-bg">
												<table class="table-bordered">
													<tbody>
														<tr>
															<td class="fc-week-number " style="width: 18.5px;"></td>
															<td class="fc-day  fc-sun fc-other-month fc-past"
																data-date="2020-04-26"></td>
															<td class="fc-day  fc-mon fc-other-month fc-past"
																data-date="2020-04-27"></td>
															<td class="fc-day  fc-tue fc-other-month fc-past"
																data-date="2020-04-28"></td>
															<td class="fc-day  fc-wed fc-other-month fc-past"
																data-date="2020-04-29"></td>
															<td class="fc-day  fc-thu fc-other-month fc-past"
																data-date="2020-04-30"></td>
															<td class="fc-day  fc-fri fc-past" data-date="2020-05-01"></td>
															<td class="fc-day  fc-sat fc-past" data-date="2020-05-02"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="fc-content-skeleton">
												<table>
													<thead>
														<tr>
															<td class="fc-week-number" style="width: 18.5px;"><span>18</span></td>
															<td class="fc-day-top fc-sun fc-other-month fc-past"
																data-date="2020-04-26"><span class="fc-day-number">26</span></td>
															<td class="fc-day-top fc-mon fc-other-month fc-past"
																data-date="2020-04-27"><span class="fc-day-number">27</span></td>
															<td class="fc-day-top fc-tue fc-other-month fc-past"
																data-date="2020-04-28"><span class="fc-day-number">28</span></td>
															<td class="fc-day-top fc-wed fc-other-month fc-past"
																data-date="2020-04-29"><span class="fc-day-number">29</span></td>
															<td class="fc-day-top fc-thu fc-other-month fc-past"
																data-date="2020-04-30"><span class="fc-day-number">30</span></td>
															<td class="fc-day-top fc-fri fc-past"
																data-date="2020-05-01"><span class="fc-day-number">1</span></td>
															<td class="fc-day-top fc-sat fc-past"
																data-date="2020-05-02"><span class="fc-day-number">2</span></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="fc-event-container"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-title">All Day Event</span>
																	</div></a></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="fc-row fc-week table-bordered fc-rigid"
											style="height: 107px;">
											<div class="fc-bg">
												<table class="table-bordered">
													<tbody>
														<tr>
															<td class="fc-week-number " style="width: 18.5px;"></td>
															<td class="fc-day  fc-sun fc-past" data-date="2020-05-03"></td>
															<td class="fc-day  fc-mon fc-past" data-date="2020-05-04"></td>
															<td class="fc-day  fc-tue fc-past" data-date="2020-05-05"></td>
															<td class="fc-day  fc-wed fc-past" data-date="2020-05-06"></td>
															<td class="fc-day  fc-thu fc-past" data-date="2020-05-07"></td>
															<td class="fc-day  fc-fri fc-past" data-date="2020-05-08"></td>
															<td class="fc-day  fc-sat fc-past" data-date="2020-05-09"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="fc-content-skeleton">
												<table>
													<thead>
														<tr>
															<td class="fc-week-number" style="width: 18.5px;"><span>19</span></td>
															<td class="fc-day-top fc-sun fc-past"
																data-date="2020-05-03"><span class="fc-day-number">3</span></td>
															<td class="fc-day-top fc-mon fc-past"
																data-date="2020-05-04"><span class="fc-day-number">4</span></td>
															<td class="fc-day-top fc-tue fc-past"
																data-date="2020-05-05"><span class="fc-day-number">5</span></td>
															<td class="fc-day-top fc-wed fc-past"
																data-date="2020-05-06"><span class="fc-day-number">6</span></td>
															<td class="fc-day-top fc-thu fc-past"
																data-date="2020-05-07"><span class="fc-day-number">7</span></td>
															<td class="fc-day-top fc-fri fc-past"
																data-date="2020-05-08"><span class="fc-day-number">8</span></td>
															<td class="fc-day-top fc-sat fc-past"
																data-date="2020-05-09"><span class="fc-day-number">9</span></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td rowspan="2"></td>
															<td rowspan="2"></td>
															<td rowspan="2"></td>
															<td rowspan="2"></td>
															<td class="fc-event-container" colspan="3"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-title">Long Event</span>
																	</div></a></td>
														</tr>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td></td>
															<td></td>
															<td class="fc-event-container"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-time">4p</span> <span class="fc-title">Repeating
																			Event</span>
																	</div></a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="fc-row fc-week table-bordered fc-rigid"
											style="height: 107px;">
											<div class="fc-bg">
												<table class="table-bordered">
													<tbody>
														<tr>
															<td class="fc-week-number " style="width: 18.5px;"></td>
															<td class="fc-day  fc-sun fc-past" data-date="2020-05-10"></td>
															<td class="fc-day  fc-mon fc-past" data-date="2020-05-11"></td>
															<td class="fc-day  fc-tue fc-past" data-date="2020-05-12"></td>
															<td class="fc-day  fc-wed fc-past" data-date="2020-05-13"></td>
															<td class="fc-day  fc-thu fc-past" data-date="2020-05-14"></td>
															<td class="fc-day  fc-fri fc-past" data-date="2020-05-15"></td>
															<td class="fc-day  fc-sat fc-past" data-date="2020-05-16"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="fc-content-skeleton">
												<table>
													<thead>
														<tr>
															<td class="fc-week-number" style="width: 18.5px;"><span>20</span></td>
															<td class="fc-day-top fc-sun fc-past"
																data-date="2020-05-10"><span class="fc-day-number">10</span></td>
															<td class="fc-day-top fc-mon fc-past"
																data-date="2020-05-11"><span class="fc-day-number">11</span></td>
															<td class="fc-day-top fc-tue fc-past"
																data-date="2020-05-12"><span class="fc-day-number">12</span></td>
															<td class="fc-day-top fc-wed fc-past"
																data-date="2020-05-13"><span class="fc-day-number">13</span></td>
															<td class="fc-day-top fc-thu fc-past"
																data-date="2020-05-14"><span class="fc-day-number">14</span></td>
															<td class="fc-day-top fc-fri fc-past"
																data-date="2020-05-15"><span class="fc-day-number">15</span></td>
															<td class="fc-day-top fc-sat fc-past"
																data-date="2020-05-16"><span class="fc-day-number">16</span></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="fc-event-container"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-time">4p</span> <span class="fc-title">Repeating
																			Event</span>
																	</div></a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="fc-row fc-week table-bordered fc-rigid"
											style="height: 107px;">
											<div class="fc-bg">
												<table class="table-bordered">
													<tbody>
														<tr>
															<td class="fc-week-number " style="width: 18.5px;"></td>
															<td class="fc-day  fc-sun fc-past" data-date="2020-05-17"></td>
															<td class="fc-day  fc-mon fc-past" data-date="2020-05-18"></td>
															<td class="fc-day  fc-tue fc-past" data-date="2020-05-19"></td>
															<td class="fc-day  fc-wed fc-today alert alert-info"
																data-date="2020-05-20"></td>
															<td class="fc-day  fc-thu fc-future"
																data-date="2020-05-21"></td>
															<td class="fc-day  fc-fri fc-future"
																data-date="2020-05-22"></td>
															<td class="fc-day  fc-sat fc-future"
																data-date="2020-05-23"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="fc-content-skeleton">
												<table>
													<thead>
														<tr>
															<td class="fc-week-number" style="width: 18.5px;"><span>21</span></td>
															<td class="fc-day-top fc-sun fc-past"
																data-date="2020-05-17"><span class="fc-day-number">17</span></td>
															<td class="fc-day-top fc-mon fc-past"
																data-date="2020-05-18"><span class="fc-day-number">18</span></td>
															<td class="fc-day-top fc-tue fc-past"
																data-date="2020-05-19"><span class="fc-day-number">19</span></td>
															<td class="fc-day-top fc-wed fc-today alert alert-info"
																data-date="2020-05-20"><span class="fc-day-number">20</span></td>
															<td class="fc-day-top fc-thu fc-future"
																data-date="2020-05-21"><span class="fc-day-number">21</span></td>
															<td class="fc-day-top fc-fri fc-future"
																data-date="2020-05-22"><span class="fc-day-number">22</span></td>
															<td class="fc-day-top fc-sat fc-future"
																data-date="2020-05-23"><span class="fc-day-number">23</span></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td rowspan="3"></td>
															<td rowspan="3"></td>
															<td class="fc-event-container" colspan="2"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-title">Conference</span>
																	</div></a></td>
															<td class="fc-event-container" rowspan="3"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-time">7a</span> <span class="fc-title">Birthday
																			Party</span>
																	</div></a></td>
															<td rowspan="3"></td>
															<td rowspan="3"></td>
														</tr>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td rowspan="2"></td>
															<td class="fc-event-container"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-time">10:30a</span> <span
																			class="fc-title">Meeting</span>
																	</div></a></td>
														</tr>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td class="fc-event-container"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div
																		class="fc-content">
																		<span class="fc-time">12p</span> <span
																			class="fc-title">Lunch</span>
																	</div></a></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="fc-row fc-week table-bordered fc-rigid"
											style="height: 107px;">
											<div class="fc-bg">
												<table class="table-bordered">
													<tbody>
														<tr>
															<td class="fc-week-number " style="width: 18.5px;"></td>
															<td class="fc-day  fc-sun fc-future"
																data-date="2020-05-24"></td>
															<td class="fc-day  fc-mon fc-future"
																data-date="2020-05-25"></td>
															<td class="fc-day  fc-tue fc-future"
																data-date="2020-05-26"></td>
															<td class="fc-day  fc-wed fc-future"
																data-date="2020-05-27"></td>
															<td class="fc-day  fc-thu fc-future"
																data-date="2020-05-28"></td>
															<td class="fc-day  fc-fri fc-future"
																data-date="2020-05-29"></td>
															<td class="fc-day  fc-sat fc-future"
																data-date="2020-05-30"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="fc-content-skeleton">
												<table>
													<thead>
														<tr>
															<td class="fc-week-number" style="width: 18.5px;"><span>22</span></td>
															<td class="fc-day-top fc-sun fc-future"
																data-date="2020-05-24"><span class="fc-day-number">24</span></td>
															<td class="fc-day-top fc-mon fc-future"
																data-date="2020-05-25"><span class="fc-day-number">25</span></td>
															<td class="fc-day-top fc-tue fc-future"
																data-date="2020-05-26"><span class="fc-day-number">26</span></td>
															<td class="fc-day-top fc-wed fc-future"
																data-date="2020-05-27"><span class="fc-day-number">27</span></td>
															<td class="fc-day-top fc-thu fc-future"
																data-date="2020-05-28"><span class="fc-day-number">28</span></td>
															<td class="fc-day-top fc-fri fc-future"
																data-date="2020-05-29"><span class="fc-day-number">29</span></td>
															<td class="fc-day-top fc-sat fc-future"
																data-date="2020-05-30"><span class="fc-day-number">30</span></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="fc-event-container"><a
																class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"
																href="http://google.com/"><div class="fc-content">
																		<span class="fc-title">Click for Google</span>
																	</div></a></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="fc-row fc-week table-bordered fc-rigid"
											style="height: 107px;">
											<div class="fc-bg">
												<table class="table-bordered">
													<tbody>
														<tr>
															<td class="fc-week-number " style="width: 18.5px;"></td>
															<td class="fc-day  fc-sun fc-future"
																data-date="2020-05-31"></td>
															<td class="fc-day  fc-mon fc-other-month fc-future"
																data-date="2020-06-01"></td>
															<td class="fc-day  fc-tue fc-other-month fc-future"
																data-date="2020-06-02"></td>
															<td class="fc-day  fc-wed fc-other-month fc-future"
																data-date="2020-06-03"></td>
															<td class="fc-day  fc-thu fc-other-month fc-future"
																data-date="2020-06-04"></td>
															<td class="fc-day  fc-fri fc-other-month fc-future"
																data-date="2020-06-05"></td>
															<td class="fc-day  fc-sat fc-other-month fc-future"
																data-date="2020-06-06"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="fc-content-skeleton">
												<table>
													<thead>
														<tr>
															<td class="fc-week-number" style="width: 18.5px;"><span>23</span></td>
															<td class="fc-day-top fc-sun fc-future"
																data-date="2020-05-31"><span class="fc-day-number">31</span></td>
															<td class="fc-day-top fc-mon fc-other-month fc-future"
																data-date="2020-06-01"><span class="fc-day-number">1</span></td>
															<td class="fc-day-top fc-tue fc-other-month fc-future"
																data-date="2020-06-02"><span class="fc-day-number">2</span></td>
															<td class="fc-day-top fc-wed fc-other-month fc-future"
																data-date="2020-06-03"><span class="fc-day-number">3</span></td>
															<td class="fc-day-top fc-thu fc-other-month fc-future"
																data-date="2020-06-04"><span class="fc-day-number">4</span></td>
															<td class="fc-day-top fc-fri fc-other-month fc-future"
																data-date="2020-06-05"><span class="fc-day-number">5</span></td>
															<td class="fc-day-top fc-sat fc-other-month fc-future"
																data-date="2020-06-06"><span class="fc-day-number">6</span></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="fc-week-number" style="width: 18.5px"></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
	<%@ include file="./common/footer.jsp" %>
</body>
<script>
	$(function() {
		$('#calendar').fullCalendar({
			themeSystem : 'bootstrap4',
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listMonth'
			},
			weekNumbers : true,
			eventLimit : true, // allow "more" link when too many events
			events : 'https://fullcalendar.io/demo-events.json'
		});

	});
</script>
<style>
#calendar {
	width: calc(100% - 250px);
	margin-left: 220px;
}
</style>
</html>