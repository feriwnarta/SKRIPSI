<?php
	class db{

		var $mysqli_host_app    = "193.203.185.1";
	    var $mysqli_database_app = "u238830624_bgm";
	    var $mysqli_user_app     = "u238830624_bgm";
	    var $mysqli_password_app = "e+WLHbp;etH3";

	    var $mysqli_host_rw     = "193.203.185.1";
	    var $mysqli_database_rw = "u238830624_rw";
	    var $mysqli_user_rw     = "u238830624_rw";
	    var $mysqli_password_rw = "e+WLHbp;etH3";

		var $query = '';
		var $query_rw  = '';

		function __construct(){
			$this->query = mysqli_connect($this->mysqli_host_app, $this->mysqli_user_app, $this->mysqli_password_app,$this->mysqli_database_app);
			$this->query_rw = mysqli_connect($this->mysqli_host_rw, $this->mysqli_user_rw, $this->mysqli_password_rw,$this->mysqli_database_rw);
		}

		function count($table, $where, $kolom) {
			$query = mysqli_query($this->query, "SELECT COUNT($kolom) AS count FROM $table WHERE $where");
			return $query;
		}
		
		function select_rw($table,$where,$by,$aksi,$kolom='*'){
			$query_rw = mysqli_query($this->query_rw,"SELECT $kolom FROM $table where $where order by $by $aksi");
			return $query_rw;
		}

		function select($table,$where,$by,$aksi,$kolom='*'){
			$query = mysqli_query($this->query,"SELECT $kolom FROM $table where $where order by $by $aksi");
			return $query;
		}
		
		function select_distinct_rw($kolom, $table, $where, $groupby, $aksi) {
		    $query_rw = mysqli_query($this->query_rw, "SELECT DISTINCT $kolom FROM $table WHERE $where GROUP BY $groupby $aksi");
		    return $query_rw;
		}

		function selectpage($table,$where,$by,$aksi,$awal,$akhir,$kolom='*'){
			$query = mysqli_query($this->query,"SELECT $kolom FROM $table where $where order by $by $aksi LIMIT {$awal} , {$akhir}");
			return $query;
		}
		
		function select_chart($table, $kolom, $where) {
		    $query = mysqli_query($this->query, "SELECT HOUR({$kolom}) as hour, COUNT(*) as num_rows FROM {$table} WHERE {$where} GROUP BY HOUR({$kolom})");
		    return $query;
		}

		function insert($table,$set){
			$query = mysqli_query($this->query,"INSERT INTO $table SET $set");
			return $query;
		}

		function update($table,$set,$where){
			$query = mysqli_query($this->query,"UPDATE $table SET $set WHERE $where");
			return $query;
		}

		function hapus($table,$where){
			$query = mysqli_query($this->query,"DELETE FROM $table WHERE $where");
			return $query;
		}
		
		function affectedRows() {
			return mysqli_affected_rows($this->query);
		}
	}
?>