<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="   " %>
<!-- 검색창 -->
                        <div class="tab-pane active" id="search" role="tabpanel" aria-labelledby="search-tab">
                            <div id="menu_wrap" class="bg_white" >
                                <div class="option">
                                    <form onsubmit="searchPlaces(); return false;">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="검색할 곳을 입력하세요" aria-label="Recipient's username"
                                                id="keyword" size="15" aria-describedby="button-addon2" >
                                            <input class="btn btn-success " type="button" id="searchBtn" value="검색하기" />
<!--                                             <input class="btn btn-outline-secondary btn-success" type="button" id="searchBtn" value="검색하기" /> -->
                                        </div>
                                            <div class="input-group mb-3">
                                                <input type="text" id="strInput" class="form-control" readonly="readonly">
                                                <span class="btn btn-success" id="inputGroup-sizing-default" style="width: 90px">출발지</span>
<!--                                                 <input type="text" id="strInput" class="form-control" aria-label="Sizing example input"
                                                    aria-describedby="inputGroup-sizing-default"readonly="readonly">
                                                <span class="input-group-text" id="inputGroup-sizing-default">출발지</span> -->
                                                <input type="hidden" id="strHidden">
                                            </div>
                                            <div class="input-group mb-3">
                                                <input type="text" id="endInput" class="form-control" aria-label="Sizing example input"
                                                    aria-describedby="inputGroup-sizing-default" readonly="readonly">
                                                <span class="btn btn-success" id="inputGroup-sizing-default"style="width: 90px">도착지</span>
                                                <input type="hidden" id="endHidden">
                                            </div>
                                            <div class="input-group mb-3">
                                                <input type="reset" id="resetBtn" value="초기화" class="btn btn-success" >
                                                <input type="button" id="directionsBtn"value="길찾기"  class="btn btn-success" >
<!--                                                 <input type="reset" id="resetBtn" value="초기화" class="btn btn-outline-secondary " >
                                                <input type="button" id="directionsBtn"value="길찾기"  class="btn btn-outline-secondary" > -->
                                            </div>
                                    </form>
                                </div>
                            </div>
                                <!-- 검색결과 div -->
                                <div id="search-results">
                                    <hr>
                                    <ul id="placesList" class="list list-inline"></ul>
                                    <ul id="pagination"class="pagination justify-content-center"></ul>
                                </div>  
                        </div>