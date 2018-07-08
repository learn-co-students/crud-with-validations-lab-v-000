<%= form_for(@song) do |f| %>
  <% if @song.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@song.errors.count, "error") %> prohibited this song from being saved:</h2>

      <ul>
      <% @song.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field<%= ' field_with_errors' if @song.errors[:title].any? %>">
    <%= f.label :title, "Title" %>
    <%= f.text_field :title, @song.title %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:released].any? %>">
    <%= f.label :released, "Released? (true/false)" %>
    <%= f.text_field :released, @song.released %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:release_year].any? %>">
    <%= f.label :release_year, "Release Year" %>
    <%= f.text_field :release_year, @song.release_year %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:artist_name].any? %>">
    <%= f.label :artist_name, "Artist Name" %>
    <%= f.text_field :artist_name, @song.artist_name %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:genre].any? %>">
    <%= f.label :genre, "Genre" %>
    <%= f.text_field :genre, @song.genre %>
  </div>

  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>


#################


<h2>Create an Song</h2>
<%= form_tag songs_path, method: "post" do %>

  <% if @song.errors.any? %>
    <div id="error_explanation">
      <h2>There were some errors:</h2>
      <ul>
        <% @song.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field<%= ' field_with_errors' if @song.errors[:title].any? %>">
    <%= label_tag "title", "Title" %>
    <%= text_field_tag "title", @song.title %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:released].any? %>">
    <%= label_tag "released", "Released" %>
    <%= text_field_tag "released", @song.released %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:release_year].any? %>">
    <%= label_tag "release_year", "Phone Number" %>
    <%= text_field_tag "release_year", @song.release_year %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:artist_name].any? %>">
    <%= label_tag "artist_name", "Artist Name" %>
    <%= text_field_tag "artist_name", @song.artist_name %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:genre].any? %>">
    <%= label_tag "genre", "Genre" %>
    <%= text_field_tag "genre", @song.genre %>
  </div>

  <%= submit_tag "Create" %>
<% end %>
