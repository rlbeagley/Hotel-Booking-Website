<%@ page import = "com.demo.employeeService"%>
<%@ page import="java.util.List" %>
<%@ page import = "com.demo.booking"%>
<%@ page import = "com.demo.bookingService"%>

<%
    int hotelid=0;
    int id =0;
    if((request.getParameter("hotelid"))!=null){
        hotelid = Integer.parseInt(request.getParameter("hotelid"));
    }

    if((request.getParameter("sin"))!=null){
            id = Integer.parseInt(request.getParameter("sin"));
            boolean verified = employeeService.employeeVerification(id);

                if (verified ==false) {
                    response.sendRedirect("employee_landing_page.jsp");
                }
    }

    List<booking> bookings = bookingService.bookings(hotelid);
%>


<html>
<head>
    <meta charset="UTF-8">
    <title>View Existing Bookings</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="rows">
        <div class="mygrid">
            <div class="top-left">
                <h1 class="subheading">Bookings</h1>
            </div>
            <div class="top-right">
                <a href ="employee_rentings.jsp">
                    <button class="button">View Rentings</button>
                </a>
            </div>
        </div>

        <% if (bookings.size() == 0) { %>
                <h1 class="main-header">No Bookings Found</h1>
        <% } else { %>
            <% for (booking b : bookings) { %>
                <div class = "room-info-block">
                    <div class="left-side">
                            <h1 class="room-num"><%= "Room: "+b.getroomNum() %></h1>

                            <h2 class="cust-id" ><%= "Customer ID: "+b.getID()%></h2>
                            <h2 class="hotel-id"><%= "Hotel ID: " + b.gethotelID() %></h2>
                            <h3 class= "arrival"><%= "Arrival: "+ b.getarrivalDate() %></h3>
                            <h3 class= "leave"><%= "Leave: "+ b.getleaveDate() %></h3>
                    </div>
                    <div class="booking-buttons">
                        <div class="annoying-buttons">
                            <form>
                                <input type="hidden" name="required-info" value="from-db">
                                <button class="button" type="submit" >Delete</button>
                            </form>
                            <form>
                                <input type="hidden" name="required-info" value="from-db">
                                <button class="button" type="submit" >Make Into Renting</button>

                            </form>
                    </div>
                <!-- INCOMPLETE
                need to add more hidden input types that will submit info of the booking that should be deleted,
                assuming we can fill these with info from the DB?
                hopefully
                anyways add that, rn its just placeholders
                -->
                    <form class="changes"action="employee_bookings.jsp"> <!-- i hope this refreshes-->

                        <div class="input-block">
                            <label for="arrival">Change Arrival Date</label>
                            <input type="date" id="arrival" name="arrival">
                        </div>

                        <div class="input-block">
                            <label for="leave">Change Leave Date</label>
                            <input type="date" id="leave" name="leave">
                        </div>

                        <button class="button" type="submit" >Submit Changes</button>
                    </form>
                </div>
            </div>
        <%}%>
        <%}%>
    </div>
</body>
</html>
