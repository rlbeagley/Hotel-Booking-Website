<%@ page import = "com.demo.employeeService"%>

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
                <a href ="employee_bookings.jsp">
                    <button class="button">View Bookings</button>
                </a>
            </div>
        </div>
        <!-- this is the result of me poorly naming classes without considering reusability,
        this is actually the booking-info blocks-->
        <div class = "room-info-block">
            <div class="info-text">

                <h1>Room 000</h1>
                <h2>Customer ID: 123456789</h2>
                <h2>Hotel ID: 0000200</h2>
                <h3>Check-in: 00/00/0000</h3>
                <h3>Check-out: 00/00/0000</h3>



            </div>
            <div class="booking-buttons">
                <div class="annoying-buttons">
                    <form>
                        <input type="hidden" name="required-info" value="from-db">
                        <button class="button" type="submit" >Delete</button>
                    </form>
                </div>
                <!-- INCOMPLETE
                need to add more hidden input types that will submit info of the booking that should be deleted,
                assuming we can fill these with info from the DB?
                hopefully
                anyways add that, rn its just placeholders
                -->
                <form class="changes"action="employee_rentings.jsp"> <!-- i hope this refreshes-->

                    <div class="input-block">
                        <label for="checkin">Change Check-in</label>
                        <input type="date" id="checkin" name="checkin">
                    </div>

                    <div class="input-block">
                        <label for="checkout">Change Check-out</label>
                        <input type="date" id="checkout" name="checkout">
                    </div>

                    <button class="button" type="submit" >Submit Changes</button>
                </form>

            </div>
        </div>
    </div>
</body>
</html>
