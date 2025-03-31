<%@ page import = "com.demo.employeeService"%>
<%@ page import="java.util.List" %>
<%@ page import = "com.demo.renting"%>
<%@ page import = "com.demo.rentingService"%>

<%
    int hotelid=0;
    int id=0;
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

    if (request.getMethod().equals("POST")){
        String button = request.getParameter("action");
        int roomNum = Integer.parseInt(request.getParameter("roomNum"));
        //int hotelid = Integer.parseInt(request.getParameter("hotelid"));
        int custid = Integer.parseInt(request.getParameter("id"));

        System.out.println(button);
        if("delete".equals(button)){
            rentingService.deleteRenting(roomNum, hotelid, custid);
        } else if ("checkOut".equals(button)){
            out.println("working");
            rentingService.updateRenting(roomNum, hotelid, custid);
        }
        response.sendRedirect(request.getRequestURI() + "?hotelid=" + hotelid);
    }


    List<renting> rentings = rentingService.rentings(hotelid);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>View Existing Rentings</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="rows">
        <div class="mygrid">
            <div class="top-left">
                <h1 class="subheading">Rentings</h1>
            </div>
            <div class="top-right">
                <a href ="employee_bookings.jsp?hotelid=<%= hotelid %>">
                    <button class="button">View Bookings</button>
                </a>
            </div>
        </div>
        <% if (rentings.size() == 0) { %>
            <h1 class="main-header">No Rentings Found</h1>
        <% } else { %>
            <% for (renting r : rentings) { %>
                 <div class = "room-info-block">
                      <div class="info-text">
                           <h1 class="room-num"><%= "Room: "+r.getroomNum() %></h1>

                           <h2 class="cust-id" ><%= "Customer ID: "+r.getID()%></h2>
                           <h2 class="hotel-id"><%= "Hotel ID: " + r.gethotelId() %></h2>
                           <h3 class= "cin"><%= "Check in: "+ r.getCheckIn() %></h3>
                           <h3 class= "cout"><%= "Check out: "+ r.getCheckOut() %></h3>
                      </div>
                      <div class="booking-buttons">
                           <div class="annoying-buttons">
                                <form method = "post">

                                    <input type="hidden" name="roomNum" value="<%= r.getroomNum() %>">
                                    <input type="hidden" name="id" value="<%= r.getID() %>">
                                    <input type="hidden" name="hotelid" value="<%= r.gethotelId() %>">
                                    <button class="button" type="submit" name="action" value = "delete" >Delete</button>
                                </form>
                                <form method = "post">
                                    <input type="hidden" name="roomNum" value="<%= r.getroomNum() %>">
                                    <input type="hidden" name="id" value="<%= r.getID() %>">
                                    <input type="hidden" name="hotelid" value="<%= r.gethotelId() %>">
                                    <button class="button" type="submit" name="action" value = "checkOut">Check Out</button>
                                </form>


                        </div>

                    </div>
                </div>
        <%}%>
        <%}%>

    </div>
</body>
</html>
