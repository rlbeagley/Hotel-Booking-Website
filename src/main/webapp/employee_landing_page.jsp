<html>
<head>
    <meta charset="UTF-8">
    <title>Select Your Hotel</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
</head>
<body>
    <div class = "container">
            <form id="employee-hotel">
                <h1 class="main-header">Employee Login</h1>
                <label for="hotelid">Hotel ID</label><br>
                <select name="hotelid" id="hotelid">
                    <!-- get from DB, this is temporary-->
                    <option value="1">1</option>
                </select><br>

                <label for="name">Name</label><br>
                <input type="text" id="name" name="name" required><br>

                <label for="sin">SIN</label><br>
                <input type="number" id="sin" name="sin" required><br>

                <label for="address">Address</label><br>
                <input type="text" id="address" name="address" required><br>


                <!-- these buttons hopefully can do both things?
                1. login and 2. redirect to page based on hotel ID -->

                <div class="login-buttons">
                    <button class = "button" type = "submit" formaction="employee_bookings.jsp" >View Bookings</button>
                    <button class = "button" type = "submit" formaction="employee_rentings.jsp" >View Rentings</button>
                </div>
            </form>
    </div>

</body>
</html>
