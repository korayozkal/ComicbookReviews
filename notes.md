This page is for my notes and code for testing 

LOGOUT

Alternative 1 

<%= form_tag("/logout", method: "delete") do %>
<%= submit_tag("Logout") %>
<% end %>

Alternative  2
<%=  link_to 'Logout', logout_path, method:"delete"%>