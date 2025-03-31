<%@ page import = "com.demo.employeeService"%>
<%@ page import="java.util.List" %>
<%@ page import = "com.demo.booking"%>
<%@ page import= "com.demo. renting"%>
<%@ page import= "com.demo. rentingService"%>
<%@ page import = "com.demo.bookingService"%>
<%@ page import="java.sql.Date" %>

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

    String arrivalStr = request.getParameter("arrival");
    String leaveStr = request.getParameter("leave");


    String formSubmitted = request.getParameter("formsubmitted");

    String button = request.getParameter("action");
    int roomNum =0;
    int custid=0;


    if ("yes".equals(formSubmitted)) {
       Date arrival = Date.valueOf(arrivalStr);
       Date leave = Date.valueOf(leaveStr);
           roomNum = Integer.parseInt(request.getParameter("roomNum"));
           hotelid = Integer.parseInt(request.getParameter("hotelid"));
           custid = Integer.parseInt(request.getParameter("id"));

        if ("update".equals(button)){
            if((request.getParameter("arrival"))==null){
                arrival = Date.valueOf(request.getParameter("oldarrival"));
            } else{
                arrival = Date.valueOf(request.getParameter("arrival"));
            }
            if((request.getParameter("leave"))==null){
                leave = Date.valueOf(request.getParameter("oldleave"));
            } else{
                leave = Date.valueOf(request.getParameter("leave"));
            }
            bookingService.updateBooking(roomNum, hotelid, custid, arrival, leave);
                    response.sendRedirect(request.getRequestURI() + "?hotelid=" + hotelid);
        }

    }
        if (request.getMethod().equals("POST")){
            roomNum = Integer.parseInt(request.getParameter("roomNum"));
            hotelid = Integer.parseInt(request.getParameter("hotelid"));
            custid = Integer.parseInt(request.getParameter("id"));

            System.out.println(button);
            if("delete".equals(button)){
                bookingService.deleteBooking(roomNum, hotelid, custid);
            } else if ("renting".equals(button)){
                out.println("working");

                bookingService.deleteBooking(roomNum, hotelid, custid);
                rentingService.insertRenting(roomNum, hotelid, custid);
                response.sendRedirect(request.getRequestURI() + "?hotelid=" + hotelid);
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
                <a href ="employee_rentings.jsp?hotelid=<%= hotelid %>">
                    <button class="button">View Rentings</button>
                </a>
            </div>
        </div>

        <% if (bookings.size() == 0) { %>
                <h1 class="main-header">No Bookings Found</h1>
        <% } else { %>
            <% for (booking b : bookings) { %>
                <div class = "room-info-block">
                    <div class="info-text">
                            <h1 class="room-num"><%= "Room: "+b.getroomNum() %></h1>

                            <h2 class="cust-id" ><%= "Customer ID: "+b.getID()%></h2>
                            <h2 class="hotel-id"><%= "Hotel ID: " + b.gethotelID() %></h2>
                            <h3 class= "arrival"><%= "Arrival: "+ b.getarrivalDate() %></h3>
                            <h3 class= "leave"><%= "Leave: "+ b.getleaveDate() %></h3>
                    </div>
                    <div class="booking-buttons">
                        <div class="annoying-buttons">
                                <form method = "post">

                                    <input type="hidden" name="roomNum" value="<%= b.getroomNum() %>">
                                    <input type="hidden" name="id" value="<%= b.getID() %>">
                                    <input type="hidden" name="hotelid" value="<%= b.gethotelID() %>">
                                    <button class="button" type="submit" name="action" value = "delete" >Delete</button>
                                </form>
                                <form method = "post">

                                    <input type="hidden" name="roomNum" value="<%= b.getroomNum() %>">
                                    <input type="hidden" name="id" value="<%= b.getID() %>">
                                    <input type="hidden" name="hotelid" value="<%= b.gethotelID() %>">
                                    <input type="hidden" name="arrival" value="<%= b.getarrivalDate() %>">
                                    <input type="hidden" name="leave" value="<%= b.getleaveDate() %>">
                                    <button class="button" type="submit" name="action" value = "renting" >Make Into Renting</button>
                                </form>
                        </div>
                    </div>


                    <form class="changes"action="employee_bookings.jsp" method = "post">

                                    <input type="hidden" name="roomNum" value="<%= b.getroomNum() %>">
                                    <input type="hidden" name="id" value="<%= b.getID() %>">
                                    <input type="hidden" name="hotelid" value="<%= b.gethotelID() %>">
                                    <input type="hidden" name="oldarrival" value="<%= b.getarrivalDate() %>">
                                    <input type="hidden" name="oldleave" value="<%= b.getleaveDate() %>">
                                    <input type="hidden" name = "formsubmitted" value="yes">

                        <div class="input-block">
                            <label for="arrival">Arrival Date</label>
                            <input type="date" id="arrival" name="arrival" value= "<%= arrivalStr %>">
                        </div>

                        <div class="input-block">
                            <label for="leave">Leave Date</label>
                            <input type="date" id="leave" name="leave" value= "<%= leaveStr %>">
                        </div>


                        <button class="button" type="submit" name = "action" value="update">Submit Changes</button>
                        </div>
                    </form>
                </div>
                </div>
                </div>
            <%}%>
        <%}%>
    </div>
</body>
</html>
