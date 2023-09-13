<?php
// Basic connection settings
$hostname = '3.81.214.93';
$user = 'root';
$password = 'root';
$database = 'userinfo';

$conn = new mysqli($hostname, $user, $password, $database); //,"3306");

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
