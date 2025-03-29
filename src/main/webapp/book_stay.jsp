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
            <form id="booking-form" action="confirmed_booking.jsp">
                <label for="name">Full Name</label><br>
                <input type="text" id="name" name="name"><br>

                <label for="idnum">SIN or Other ID</label><br>
                <input type="number" id="idnum" name="idnum"><br>

                <label for="address">Address</label><br>
                <input type="text" id="address" name="address"><br>

            </form>
        </div>
        <div class="side-container">
            <h1 class="less-header">Your selected booking:</h1>
            <div class = "room-info-block">
                 <div class="left-side">
                      <h1 class="hotel-name">Hotel Name</h1>
                      <div class="rating">
                           <img class="star" src="media/star.svg" alt="star">
                           <h1>3</h1>
                      </div>

                      <h2 class="street-address">123 Street Street</h2>
                     <h2 class="room-number">Room 201</h2>
                 </div>
                      <div class="book-now">
                         <h1>$130.00</h1>
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
