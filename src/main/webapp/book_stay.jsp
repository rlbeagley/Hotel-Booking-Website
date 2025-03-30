<%@ page import ="java.sql.Date" %>
<%@ page import ="com.demo.bookingService" %>
<%@ page import ="com.demo.customerService" %>

<%
// info from previous page
    String arrivalStr = request.getParameter("arrival_date");
    String leaveStr = request.getParameter("leave_date");
    String hotelIdStr = request.getParameter("hotel_id");
    String roomNumStr = request.getParameter("room_num");
    String hotelNameStr = request.getParameter("hotel_name");
    String priceStr = request.getParameter("price");
    String hotelAddressStr = request.getParameter("hotel_address");
    String ratingStr = request.getParameter("rating");

try{

    // to see if customer filled out form, therefore booking can be done:
    String formSubmitted = request.getParameter("formsubmitted");

    if ("yes".equals(formSubmitted)) {
        // info passed from prev page
        int roomNum = Integer.parseInt(roomNumStr);
        int hotelID = Integer.parseInt(hotelIdStr);
        Date arrivalDate = Date.valueOf(arrivalStr);
        Date leaveDate = Date.valueOf(leaveStr);

        // new inputs of customer info
        int ID = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        customerService.registration(ID,name,address);
        bookingService.insertBooking(roomNum,hotelID,ID,arrivalDate,leaveDate);

        // go next page
        response.sendRedirect("confirmed_booking.jsp");
    }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>


<html>
<head>
    <meta charset="UTF-8">
    <title>Book Your Stay</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
</head>
<body>
    <div class = "container">
        <div>
            <form id="booking-form" action="book_stay.jsp" method="get">
                <!-- hidden info that will be sent when form submitted -->
                <input type ="hidden" name="room_num" value="<%= roomNumStr %>">
                <input type ="hidden" name="hotel_id" value="<%= hotelIdStr %>">
                <input type ="hidden" name="leave_date" value="<%= leaveStr %>">
                <input type ="hidden" name="arrival_date" value="<%= arrivalStr %>">
                <input type="hidden" name = "formsubmitted" value="yes">

                <!-- customer inputs that are needed -->
                <label for="name">Full Name</label><br>
                <input type="text" id="name" name="name" required><br>

                <label for="id">SIN or Other ID</label><br>
                <input type="number" id="id" name="id" required><br>

                <label for="address">Address</label><br>
                <input type="text" id="address" name="address" required><br>

            </form>
        </div>
        <div class="side-container">
            <h1 class="less-header">Your selected booking:</h1>
            <div class = "room-info-block">
                 <div class="left-side">
                      <h1 class="hotel-name"><%= hotelNameStr %></h1>
                      <div class="rating">
                           <img class="star" src="media/star.svg" alt="star">
                           <h1><%= ratingStr %></h1>
                      </div>

                     <h2 class="street-address"><%= hotelAddressStr %></h2>
                     <h2 class="room-number"><%= "Room " + roomNumStr %></h2>
                     <div class="room-info">
                                            <div class="point-item">
                                                 <span class="bullet"></span>
                                                 <h3><%= "Check in: " + arrivalStr %></h3>
                                            </div>
                                            <div class="point-item">
                                                 <span class="bullet"></span>
                                                 <h3><%= "Check out: " + leaveStr %></h3>
                                            </div>
                                         </div>

                 </div>
                      <div class="book-now">
                         <h1><%="$"+ priceStr %></h1>
                         <!-- need to incorporate backend code for queries, collecting info from form when button pressed
                                      temporarily just takes you to the next page-->
                                     <button class = "button" type = "submit" form="booking-form" >Book</button>
                      </div>
                 </div>
            </div>



        </div>
    </div>

</body>
</html>
