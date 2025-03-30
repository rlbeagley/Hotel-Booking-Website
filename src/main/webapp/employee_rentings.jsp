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
                <h3>Arrive: 00/00/0000</h3>
                <h3>Leave: 00/00/0000</h3>



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
                <form class="changes"action="employee_bookings.jsp"> <!-- i hope this refreshes-->
                    <div class="input-block">
                        <label for="checkout">Set Checkout Time</label>
                        <input type="time" id="checkout" name="checkout">
                    </div>

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
    </div>
</body>
</html>
