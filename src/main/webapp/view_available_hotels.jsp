<%@ page import="java.util.List" %>
<%@ page import="com.demo.roomService" %>
<%@ page import="com.demo.room" %>
<%@ page import="com.demo.hotelService" %>
<%@ page import="java.sql.Date" %>


<%

    String area = request.getParameter("area");
    String capacity = request.getParameter("capacity");
    String minPriceStr = request.getParameter("minprice");
    String maxPriceStr = request.getParameter("maxprice");
    String checkInStr = request.getParameter("cin");
        String checkOutStr = request.getParameter("cout");


        double minPrice = Double.parseDouble(minPriceStr);
        double maxPrice = Double.parseDouble(maxPriceStr);
        Date checkIn = Date.valueOf(checkInStr);
        Date checkOut = Date.valueOf(checkOutStr);

    List<room> rooms = roomService.filter(minPrice, maxPrice, area, capacity, checkIn, checkOut);
    List<String> cities = hotelService.cities();

%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Choose your room</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="rows">
        <form id="second-search" action="view_available_hotels.jsp" method="GET">
            <div class="row-container">

                <div class="input-block">
                    <label for="cin">Check-in</label>
                    <input type="date" id="cin" name="cin" value= "<%= checkInStr %>">
                </div>

                <div class="input-block">
                    <label for="cout">Check-out</label>
                    <input type="date" id="cout" name="cout" value= "<%= checkOutStr %>">
                </div>

                <!-- need the method that gets all areas -->

                <div class="input-block">
                    <label for="area">Area</label>
                    <select name="area" id="area">
                        <% for (String city : cities) { %>
                            <option value= "<%= city %>"><%= city %></option>
                        <% } %>
                    </select>
                </div>


                <div class="input-block">
                    <label for="capacity">Capacity</label>
                    <select name="capacity" id="capacity">
                        <option value="single" <%= "single".equals(capacity) ? "selected" : "" %>>Single(1)</option>
                        <option value="double" <%= "double".equals(capacity) ? "selected" : "" %>>Double(2)</option>
                        <option value="family" <%= "family".equals(capacity) ? "selected" : "" %>>Family(4)</option>
                        <option value="suite" <%= "suite".equals(capacity) ? "selected" : "" %>>Suite</option>
                    </select>
                </div>

                <div class="input-block">
                    <label for="minprice">Min Price</label>
                    <input type="number" id="minprice" name="minprice" min="0" step="0.01" value= "<%= minPriceStr %>" required>
                </div>

                <div class="input-block">
                    <label for="maxprice">Max Price</label>
                    <input type="number" id="maxprice" name="maxprice" min="0" step="0.01" value= "<%= maxPriceStr %>" required>
                </div>

                <button class = "button" type = "submit" form="second-search" >Search</button>

            </div>
        </form>
        <% if (rooms.size() == 0) { %>
        <h1 class="main-header">No Rooms Found</h1> <% } else { %>
        <% for (room r : rooms) { %>
        <div class = "room-info-block">
                <div class="left-side">
                    <h1 class="hotel-name"><%= r.getHotelName() %></h1>
                    <div class="rating">
                        <img class="star" src="media/star.svg" alt="star">
                        <h1><%= r.getRating() %></h1>
                    </div>

                    <h2 class="street-address"><%= r.getAddress()%></h2>
                    <h2 class="room-number"><%= "Room " + r.getRoomNum() %></h2>


                    <div class="room-info">
                       <div class="point-item">
                            <span class="bullet"></span>
                            <h3><%= "View type: "+ r.getViewType() %></h3>
                       </div>
                       <div class="point-item">
                            <span class="bullet"></span>
                            <h3><%= "Extendable: "+ r.getCanExtend() %></h3>
                       </div>

                    </div>
                </div>
                <div class="book-now">
                    <h1><%= "$" + r.getPrice() %></h1>
                    <!-- need to change so that info is sent-->
                    <a href ="book_stay.jsp?room_num=<%= r.getRoomNum() %>&hotel_id=<%= r.getHotelId() %>&arrival_date=<%= checkInStr %>&leave_date=<%= checkOutStr %>&price= <%= r.getPrice() %>&hotel_name= <%= r.getHotelName() %>&hotel_address= <%= r.getAddress()%>&rating= <%= r.getRating() %>">
                        <button class="button">Book now</button>
                    </a>
                </div>

        </div>
        <% } %>
        <% } %>
    </div>
</body>
</html>
