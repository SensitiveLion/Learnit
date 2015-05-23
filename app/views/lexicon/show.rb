<h1><%= @learnipedia.name %></h1>
<h4><%= link_to "search for more about this", course_searches_path(@learnipedia) %>
<div class="row">
  <div class="small-8 large-centered column">
    <div class="panel">
      <ol>
        <% @lessons.each do |lesson| %>
          <li class="larger"><%= lesson.title %></li>
          <ul>
            <li><%= markdown(lesson.body) %></li>
            <li><%= link_to "more information", course_lesson_path(@learnipedia, lesson) %></li>
            <div class="right">
              <% if current_user != nil %>
                <% if current_user.has_authority? %>
                  <%= link_to "Edit", edit_lesson_path(lesson) %> ||
                  <%= link_to "Delete", lesson, method: :delete %>
                <% end %>
              <% end %>
            </div>
          </ul>
        <% end %>
      </ol>
    </div>
    <div class="right">
      <% if current_user != nil %>
        <% if current_user.has_authority? %>
          <%= link_to "Edit", edit_course_path(@learnipedia), class: :readable  %> ||
          <%= link_to "Delete", @learnipedia, method: :delete, class: :readable  %>
        <% end %>
      <% end %>
    </div>
  </div>
</div>


