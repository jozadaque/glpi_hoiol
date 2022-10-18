String ticket = r'''
{
  "id": 1,
  "entities_id": 0,
  "name": "Nobreak Não esta Funcionando",
  "date": "2022-07-25 08:10:40",
  "closedate": "2022-07-28 09:00:49",
  "solvedate": "2022-07-25 09:38:04",
  "date_mod": "2022-07-28 09:00:49",
  "users_id_lastupdater": 9,
  "status": 6,
  "users_id_recipient": 7,
  "requesttypes_id": 1,
  "content": "&#60;p&#62;Bom dia,&#60;/p&#62;\n&#60;p&#62;Meu Nobreak não esta funcionando, somente apitando.&#60;/p&#62;\n&#60;p&#62;Usuário: Agnaldo&#60;/p&#62;",
  "urgency": 3,
  "impact": 3,
  "priority": 3,
  "itilcategories_id": 0,
  "type": 2,
  "global_validation": 1,
  "slas_id_ttr": 0,
  "slas_id_tto": 0,
  "slalevels_id_ttr": 0,
  "time_to_resolve": null,
  "time_to_own": null,
  "begin_waiting_date": "2022-07-25 09:38:04",
  "sla_waiting_duration": 0,
  "ola_waiting_duration": 0,
  "olas_id_tto": 0,
  "olas_id_ttr": 0,
  "olalevels_id_ttr": 0,
  "ola_ttr_begin_date": null,
  "internal_time_to_resolve": null,
  "internal_time_to_own": null,
  "waiting_duration": 0,
  "close_delay_stat": 111009,
  "solve_delay_stat": 5244,
  "takeintoaccount_delay_stat": 3756,
  "actiontime": 0,
  "is_deleted": 0,
  "locations_id": 63,
  "validation_percent": 0,
  "date_creation": "2022-07-25 08:10:40",
  "links": [
    {
      "rel": "Entity",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Entity/0"
    },
    {
      "rel": "User",
      "href": "http://191.7.192.130:11040/ti/apirest.php/User/9"
    },
    {
      "rel": "User",
      "href": "http://191.7.192.130:11040/ti/apirest.php/User/7"
    },
    {
      "rel": "RequestType",
      "href": "http://191.7.192.130:11040/ti/apirest.php/RequestType/1"
    },
    {
      "rel": "Location",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Location/63"
    },
    {
      "rel": "Document_Item",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/Document_Item/"
    },
    {
      "rel": "TicketTask",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/TicketTask/"
    },
    {
      "rel": "TicketValidation",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/TicketValidation/"
    },
    {
      "rel": "TicketCost",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/TicketCost/"
    },
    {
      "rel": "Problem_Ticket",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/Problem_Ticket/"
    },
    {
      "rel": "Change_Ticket",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/Change_Ticket/"
    },
    {
      "rel": "Item_Ticket",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/Item_Ticket/"
    },
    {
      "rel": "ITILSolution",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/ITILSolution/"
    },
    {
      "rel": "ITILFollowup",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/ITILFollowup/"
    },
    {
      "rel": "Ticket_User",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/Ticket_User/"
    },
    {
      "rel": "Group_Ticket",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/Group_Ticket/"
    },
    {
      "rel": "Supplier_Ticket",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Ticket/1/Supplier_Ticket/"
    }
  ]
}
''';

String category = r'''
{
  "id": 7,
  "entities_id": 0,
  "is_recursive": 0,
  "itilcategories_id": 0,
  "name": "NOBREAK - FALHA/DEFEITO",
  "completename": "NOBREAK - FALHA/DEFEITO",
  "comment": "",
  "level": 1,
  "knowbaseitemcategories_id": 0,
  "users_id": 0,
  "groups_id": 0,
  "code": "",
  "ancestors_cache": "[]",
  "sons_cache": null,
  "is_helpdeskvisible": 1,
  "tickettemplates_id_incident": 0,
  "tickettemplates_id_demand": 0,
  "changetemplates_id": 0,
  "problemtemplates_id": 0,
  "is_incident": 1,
  "is_request": 1,
  "is_problem": 1,
  "is_change": 1,
  "date_mod": "2022-07-25 09:01:10",
  "date_creation": "2022-07-25 09:01:10",
  "links": [
    {
      "rel": "Entity",
      "href": "http://191.7.192.130:11040/ti/apirest.php/Entity/0"
    }
  ]
}
''';
