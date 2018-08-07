view: flights {
  sql_table_name: faa.flights ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  dimension_group: dep {
    type: time
    timeframes: [
      raw,
      time,
      date,
      month,
      year
    ]
    sql: ${TABLE}.dep_time ;;
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension_group: arr {
    type: time
    timeframes: [
      raw,
      time,
      date,
      month,
      year
    ]
    sql: ${TABLE}.arr_time ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: route {
    type: string
    sql: concat(${origin}, '-', ${destination} )  ;;
  }

  measure: flight_count {
    type: count
  }
}
