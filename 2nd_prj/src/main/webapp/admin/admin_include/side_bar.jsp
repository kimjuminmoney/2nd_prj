<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">메뉴</div>
						<a class="nav-link" href="../dashboard/index.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 대쉬보드
						</a>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 휴게소 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="../restarea/manageFood.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 음식
								</a> <a class="nav-link" href="../restarea/manageConv.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 편의시설
								</a> <a class="nav-link" href="../restarea/manageBrand.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 매장시설
								</a> <a class="nav-link" href="../restarea/manageGas.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 주유소 정보
								</a> <a class="nav-link" href="../restarea/addRest.jsp">
									<div class="sb-nav-link-icon">
										<i class="fas fa-table"></i>
									</div> 휴게소 추가
								</a>
							</nav>
						</div>

						<a class="nav-link" href="../review/reviewAdmin.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 리뷰 관리
						</a> <a class="nav-link" href="../cs/complain_admin.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 문의
						</a> <a class="nav-link" href="../MembershipManagement/MembershipManagement.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 회원 관리
						</a> <a class="nav-link" href="../notice/manageNotice.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 공지사항
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>