This page is for my notes and code for testing 

LOGOUT

Alternative 1 

<%= form_tag("/logout", method: "delete") do %>
<%= submit_tag("Logout") %>
<% end %>

Alternative  2
<%=  link_to 'Logout', logout_path, method:"delete"%>

Path Helpers
<h2>Sign Up here</h2>
<%= link_to "Sign Up", signup_path %>
<h2>Login here</h2>
<%= link_to "Login", login_path %>  
we can always go to classical method like
<%= link_to "Login", '/login' %>  

What is the difference
<%= form_for(@user, url:'/signup') do |f| %>
here we are sending the form as an object
<%= form_for :user do |f| %> this works for login because we are trying to create an object.
