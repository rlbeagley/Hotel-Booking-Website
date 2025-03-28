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
            <form id="search-hotels-form" action="book_stay.jsp">
                <label for="cin">Check-in</label><br>
                <input type="date" id="cin" name="cin"><br>
                <label for="cout">Check-in</label><br>
                <input type="date" id="cout" name="cout"><br>
                <label for="area">Area</label><br>

                <!-- need to change, this is temp
                options should be all areas in db -->
                <select name="area" id="area">
                    <option value="bikinibottom">Bikini Bototm</option>
                </select><br>

                <label for "capacity">Capacity</label><br>
                <select name = "capacity" id="capacity">
                    <option value="single">Single(1)</option>
                    <option value="double">Double(2)</option>
                    <option value="family">Family(4)</option>
                    <option value="suite">Suite</option>
                </select><br>


                <label for="minprice">Min Price</label><br>
                <input type="number" id="minprice" name="minprice" min="0" step="0.01" required><br>

                <label for="maxprice">Max Price</label><br>
                <input type="number" id="maxprice" name="maxprice" min="0" step="0.01" required><br>



            </form>
        </div>
        <div class="side-container">
            <h1 class="less-header">Ready to book a place?</h1>
            <h2 class="new-subheading">Please select your requirements for your upcoming stay.</h2>

            <!-- need to incorporate backend code for queries, collecting info from form when button pressed
             temporarily just takes you to the next page-->
            <button class = "button" type = "submit" form="search-hotels-form" >Search</button>
        </div>
    </div>

</body>
</html>
