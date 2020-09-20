    
    layouts application.html.erb 

    <div>
      <% if logged_in%>
      <%= link_to "Home", user_path(current_user)%> |
      <%= link_to "Logout", logout_path, method:"delete"%>

      <% else %>
      <%=link_to "Sign Up", signup_path %> |
      <%=link_to "Log In", login_path %>
      <% end %>

    </div>

    <div>
      <% if flash[:message] %>
          <%= flash[:message]%>

      <% end %>
      <%= @error%>
    </div>