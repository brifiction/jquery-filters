# jquery-filters
jquery-filters repository contains several examples on how to filter search results with jQuery.

### Description
This repository contains several examples of how to filter search results with jQuery. 

There are several ways to approach this, however this example is focused on the use of jQuery selectors (<a href="https://api.jquery.com/category/selectors/" target="_blank">here</a>) and the use of <code>.hide()</code> and <code>.css()</code>.

In my opinion, the use of regular expressions is fundamental to any form of filtering returned or sent data. Click <a href="http://www.regexr.com/" target="_blank">here</a> for a useful regex online tool to experiment and test your expressions.

### Installation

If you need an apache server, I use Apache Tomcat for Java development. The download links are below:

Download Apache Tomcat here: http://tomcat.apache.org/index.html

Download jquery here: https://jquery.com/download/

jQuery-UI is not necessary for this example but its useful if you'd like to use it for your project.

Download jquery-ui here: http://jqueryui.com/download/

JSON is not necessary either but here is the download link if you would like to learn more on how to implement both jQuery and JSON. Below is the JAR file for Apache Tomcat, but there are other alternatives such as json-simple.

Download JSON JAR here: http://www.java2s.com/Code/Jar/j/Downloadjavajsonjar.htm (Apache Tomcat Only)

### API Reference

jQuery have a ton of functionalities and it is important to keep an update on its features and bugs. Also, keep in mind of cross-browser issues as you may encounter them in the future. Below is the link for the jQuery API documentation:

jQuery API Documentation: https://api.jquery.com/

jQuery UI is an extension of jQuery and it is a valuable asset. It is catered to full functionality customization and with great integration with other plugins. For example, the most popular usage is the datepicker function, which you may have seen it implemented in most web applications from both private and government sectors.

jQuery UI API Documentation: https://api.jqueryui.com/

### Testing and Understanding

The sample results are categorized based on these attributes, for example <code>data-id="A123" data-category="fruit apple"</code>. 

You'll notice that the attribute <code>data-category</code> have two values (seperated by space). It is formatted to place each result with specific categories, for example:

Parent Category: <b>fruit</b><br>
Child Category: <b>apple</b>

However, <code>data-id</code> does not contribute much at the moment but later in implementation, you may come across certain scenarios that you may need this type of attribute, whether it is the ISBN number of a book or employee ID number to match the employee's gathered information.

### License

The MIT License is a free software license originating at the Massachusetts Institute of Technology (MIT). It is a permissive free software license, meaning that it permits reuse within proprietary software provided all copies of the licensed software include a copy of the MIT License terms and the copyright notice. Such proprietary software retains its proprietary nature even though it incorporates software under the MIT License. The license is also GPL-compatible, meaning that the GPL permits combination and redistribution with software that uses the MIT License.

Source: https://en.wikipedia.org/wiki/MIT_License

Additional Information: http://choosealicense.com/
