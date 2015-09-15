<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"
      xmlns:h="http://java.sun.com/jsf/html"
      xmlns:f="http://java.sun.com/jsf/core">
  <head>
    <title>EXAMPLE RESOURCE</title>
    <meta name="generator" content="SilverStripe - http://silverstripe.org">
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <meta name="description" content="Example Resource">

    <link rel="stylesheet" type="text/css" href="css/reset.css" />

    <link rel="stylesheet" type="text/css" href="css/normalize.css" />

    <script type="text/javascript" src="js/jquery-1.11.3.min.js" ></script> 
    <script type="text/javascript" src="js/jquery-ui.js" ></script>

    <script type="text/javascript" src="js/list.js" ></script>

  </head>

  <body id="test">

    <script type="text/javascript">
      $(document).ready(function() {

        /* JQuery Text Field Filter Example */

        var $rows = $('.div-table-results'); /* MODIFY THIS FOR VIEW FOCUS, FOR EXAMPLE div-table, div-table-row, etc */

        $('#search-example1').keyup(function() {
          var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

          /* "SHOW" OR "CSS VISIBILIY" OPTIONS */

//          $rows.show().filter(function() {
//            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
//            return !~text.indexOf(val);
//          }).hide();

          $rows.css("visibility", "visible").filter(function() {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val);
          }).css("visibility", "hidden");

        });

        /* JQuery Checkbox Filter Results Example */

        $('.subjects-wrap , .formats-wrap').delegate('input[type=checkbox]', 'change', function() {
          var $lis = $('.catalogue-results > div'), $checked = $('input:checked');

          if ($checked.length) {
            var selector = '';
            $($checked).each(function(index, element) {
              if (selector === '') {
                selector += "[data-category~='" + element.id + "']";
              } else {
                selector += ",[data-category~='" + element.id + "']";
              }
            });
            $lis.hide();

            console.log(selector);

            $('.catalogue-results > div').hide().filter(selector).show();
          } else {
            $lis.show();
          }
        });

        /* JQuery List Example */

        var options = {
          valueNames: ['title', 'author', 'availability'] /* Declare sort types */
        };

        var recordsList = new List('records-list', options); /* Initialize new list, for example records-list */

        var noItems = $('<div style="font-size: 12px;color: red;" id="no-records-found">Search Result: No records found. Try again.</div>');

        recordsList.on('updated', function(list) {
          if (list.matchingItems.length == 0) {
            $(list.list).append(noItems);
          } else {
            noItems.detach();
          }
        });

        /* JQuery Filter Forbidden Characters Example */

        $('#someinput').keyup(function() {
          var $th = $(this);

          var filtered = $th.val().replace(/\s?[@#$%\^&*()=_+"':;\/<>\\\|{}\[\]]/g, "");

          $th.val($th.val().replace(/\s?[@#$%\^&*()=_+"':;\/<>\\\|{}\[\]]/g, function(str) {

            console.log("Forbidden Character: " + str);

            $('#saved-input').val(filtered); /* SAVED INTO HIDDEN INPUT */

            $('#wrapped-text').html($('#saved-input').val()); /* Filtered Text For Value Display */

            return '';
          }));
        }).bind('paste', function(e) {
          setTimeout(function() {

            $('#someinput').val($('#someinput').val().replace(/\s?[@#$%\^&*()=_+"':;\/<>\\\|{}\[\]]/g, function(str) {

              console.log("Forbidden Character: " + str);

              $('#saved-input').val(filtered);

              $('#wrapped-text').html($('#saved-input').val()); /* Filtered Text For Value Display */

              return '';
            }));
            $('#someinput').val($('#someinput').val().replace(/\s+/g, ' '));

          }, 100);
        });

      });
    </script>

    <h2>JQuery List and Sort Example</h2>

    <div id="records-list">

      Search: <input type="text" class="search" id="search" style="width: 300px;" placeholder="Enter search term here" />

      <input type="button" class="sort" data-sort="title" value="Sort by title"/>
      <input type="button" class="sort" data-sort="author" value="Sort by author"/>
      <input type="button" class="sort" data-sort="availability" value="Sort by availability"/>

      <!--  <ul class="list">
              <li>
                <h3 class="title">Test Title 1</h3>
                <p class="author">Gray, Walter</p>
                <p class="availability">Melbourne</p>
              </li>
              <li>
                <h3 class="title">Test Title 2</h3>
                <p class="author">Doe, John</p>
                <p class="availability">Adelaide</p>
              </li>
            </ul>-->

      <div class="list">

        <div class="div-table-results">
          <div class="div-table-row title">
            <div class="div-table-col"><strong>Title</strong></div>
            <div class="div-table-col" id="result-title-value">The Principles of Theoretical Physics </div>
          </div>
          <div class="div-table-row author">
            <div class="div-table-col"><strong>Author</strong></div>
            <div class="div-table-col" id="result-author-value">Gray, Walter</div>
          </div>
          <div class="div-table-row availability">
            <div class="div-table-col"><strong>Availability</strong></div>
            <div class="div-table-col" id="result-availability-value">Melbourne</div>
          </div>
        </div>

        <!--SECOND-->
        <div class="div-table-results">
          <div class="div-table-row title">
            <div class="div-table-col"><strong>Title</strong></div>
            <div class="div-table-col" id="result-title-value">Javascript Bible </div>
          </div>
          <div class="div-table-row author">
            <div class="div-table-col"><strong>Author</strong></div>
            <div class="div-table-col" id="result-author-value">Thompson, Peter</div>
          </div>
          <div class="div-table-row availability">
            <div class="div-table-col"><strong>Availability</strong></div>
            <div class="div-table-col" id="result-availability-value">Perth</div>
          </div>
        </div>

        <div class="div-table-results">
          <div class="div-table-row title">
            <div class="div-table-col"><strong>Title</strong></div>
            <div class="div-table-col" id="result-title-value">PHP and Javascript Development </div>
          </div>
          <div class="div-table-row author">
            <div class="div-table-col"><strong>Author</strong></div>
            <div class="div-table-col" id="result-author-value">Doe, John</div>
          </div>
          <div class="div-table-row availability">
            <div class="div-table-col"><strong>Availability</strong></div>
            <div class="div-table-col" id="result-availability-value">Melbourne</div>
          </div>
        </div>

      </div><!--list-->

    </div>


    <h2>JQuery Text Field Filter Example</h2>

    Search: <input style="width: 300px;" type="text" id="search-example1" placeholder="Enter search term here">

    <!--FIRST-->
    <div class="div-table-results">
      <div class="div-table-row">
        <div class="div-table-col"><strong>Title</strong></div>
        <div class="div-table-col" id="result-title-value">The Principles of Theoretical Physics </div>
      </div>
      <div class="div-table-row">
        <div class="div-table-col"><strong>Author</strong></div>
        <div class="div-table-col" id="result-author-value">Gray, Walter</div>
      </div>
      <div class="div-table-row">
        <div class="div-table-col"><strong>Availability</strong></div>
        <div class="div-table-col" id="result-availability-value">Melbourne</div>
      </div>
    </div>

    <!--SECOND-->
    <div class="div-table-results">
      <div class="div-table-row">
        <div class="div-table-col"><strong>Title</strong></div>
        <div class="div-table-col" id="result-title-value">Javascript Bible </div>
      </div>
      <div class="div-table-row">
        <div class="div-table-col"><strong>Author</strong></div>
        <div class="div-table-col" id="result-author-value">Thompson, Peter</div>
      </div>
      <div class="div-table-row">
        <div class="div-table-col"><strong>Availability</strong></div>
        <div class="div-table-col" id="result-availability-value">Perth</div>
      </div>
    </div>

    <!--THIRD-->
    <div class="div-table-results">
      <div class="div-table-row">
        <div class="div-table-col"><strong>Title</strong></div>
        <div class="div-table-col" id="result-title-value">PHP and Javascript Development </div>
      </div>
      <div class="div-table-row">
        <div class="div-table-col"><strong>Author</strong></div>
        <div class="div-table-col" id="result-author-value">Doe, John</div>
      </div>
      <div class="div-table-row">
        <div class="div-table-col"><strong>Availability</strong></div>
        <div class="div-table-col" id="result-availability-value">Melbourne</div>
      </div>
    </div>

    <h2>JQuery Filter Forbidden Characters Example</h2>

    Filter Unwanted Characters: <input type="text" class="savedinput" id="someinput" style="width: 300px;" placeholder="Enter text here" />

    <input type="hidden" class="saved-input" id="saved-input" style="width: 300px;" />

    <div id="wrapped-text">

    </div>



    <h2>JQuery Checkbox Filter Example</h2>

    <div class="formats-wrap">

      <h3 style="font-size:14px; font-weight:normal;">Available Formats</h3>
      <p style="margin:10px 10px 10px 0px;font-size:12px;"><strong>Filter records by format:</strong></p>

      <form>

        <div class="div-table">
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="books" /></div>
            <div class="div-table-col">Books</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="conference-papers" /></div>
            <div class="div-table-col">Conference Papers</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="journals" /></div>
            <div class="div-table-col">Journals</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="looseleafs" /></div>
            <div class="div-table-col">Looseleafs</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="online-services" /></div>
            <div class="div-table-col">Online Services</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="files" /></div>
            <div class="div-table-col">Files</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="journal-articles" /></div>
            <div class="div-table-col">Journal Articles</div>
          </div>

        </div>

      </form>

    </div>

    <div class="subjects-wrap">
      <h3 style="font-size:14px; font-weight:normal;">Available Subjects</h3>
      <p style="margin:10px 10px 10px 0px;font-size:12px;"><strong>Filter records by subject:</strong></p>

      <form>

        <div class="div-table">
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="corporations-law" /></div>
            <div class="div-table-col">Corporations Law</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="building-law" /></div>
            <div class="div-table-col">Building Law</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="employment-law" /></div>
            <div class="div-table-col">Employment Law</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="company-law" /></div>
            <div class="div-table-col">Company Law</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="banking" /></div>
            <div class="div-table-col">Banking</div>
          </div>
          <div class="div-table-row">
            <div class="div-table-col"><input type="checkbox" name="filter-results" id="finance" /></div>
            <div class="div-table-col">Finance</div>
          </div>

        </div>
      </form>
    </div>

    <div class="catalogue-results">
      <div class="catalogue-record" data-id="AAA" data-category="banking books">Law of Bank Payments</div>
      <div class="catalogue-record" data-id="BBB" data-category="company-law banking books conference-papers">New Zealand Company Law and Practice</div>
      <div class="catalogue-record" data-id="CCC" data-category="banking books conference-papers journals">Law of Commercial Companies</div>
      <div class="catalogue-record" data-id="DDD" data-category="employment-law finance looseleafs">Employee Relations Law</div> 
    </div>

    <div class="catalogue-results">
      <div class="catalogue-record" data-id="EEE" data-category="corporations-law looseleafs journal-articles">Corporations Law</div> 
      <div class="catalogue-record" data-id="FFF" data-category="corporations-law looseleafs files">Company Law and Practice</div>  
      <div class="catalogue-record" data-id="GGG" data-category="company-law finance online-services">Principles of Company Law</div>
      <div class="catalogue-record" data-id="HHH" data-category="banking building-law files">Modern Banking Law</div>  
    </div>

  </body>

</html>