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
                <h1 class="main-header"> Select your location.</h1>
                <label for="hotel">Hotel Chain</label><br>
                <select name="hotel" id="hotel">
                    <!-- get from DB, this is temporary-->
                    <option value="marriot">Marriot</option>
                </select><br>

                <label for="area">Area</label><br>
                <select name="area" id="area">
                    <!-- get from DB, this is temporary-->
                    <option value="ottawa">Ottawa</option>
                </select><br>

                <button class = "button" type = "submit" formaction="employee_bookings.jsp" >View Bookings</button>
                <button class = "button" type = "submit" formaction="employee_rentings.jsp" >View Rentings</button>
            </form>
    </div>

</body>
</html>
