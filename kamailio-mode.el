;; kamailio mode for emacs (function list is not complete)

(setq kamailio-font-lock-keywords
      (let* (
            ;; define keywords
            (x-keywords '("branch_route" "break" "case" "default" "else" "event_route" "exit" "failure_route" "for" "if" "loadmodule" "onreply_route" "onsend_route" "reply_route" "request_route" "return" "route" "switch" "while"))
            (x-types '())
            (x-constants '())
            (x-events '())
            ;; define functions
            (x-functions '("acc_db_request" "add_path_received" "add_rr_param" "allow_routing" "allow_trusted" "append_hf" "append_to_reply" "avp_check" "avp_delete" "change_reply_status" "check_route_param" "defined" "dp_translate" "ERROR" "fix_nated_sdp" "force_send_socket" "forward" "get_redirects" "handle_ruri_alias" "inactivate_gw" "INFO" "in_list" "isflagset" "is_avp_set" "isbflagset" "is_direction" "is_domain_local" "is_e164" "is_gflag" "is_gruu" "is_method" "is_numeric" "is_present_hf" "jsonrpc_dispatch" "load_gws" "lookup_domain" "lookup" "loose_route" "modparam" "mt_match" "NOTICE" "proxy_challenge" "record_route" "redirecting" "remove_hf" "resetflag" "rtpengine_answer" "rtpengine_delete" "rtpengine_offer" "save" "sdp_content" "sdp_transport" "send_reply_mode" "send_reply" "setbflag" "setflag" "setxflag" "set_reply_close" "set_reply_no_connect" "set_rtpengine_set" "set_uri_host" "set_uri_user" "set_forward_no_connect" "sql_query" "sql_result_free" "starts_with" "subst_uri" "tel2sip" "t_check_status" "t_is_canceled" "t_load_contacts" "t_next_contacts" "t_on_branch" "t_on_failure" "t_on_reply" "t_relay_cancel" "t_relay" "t_set_fr" "unregister" "WARN" "ws_handle_handshake" "www_challenge" "xhttp_reply"))
            (x-keywords-regexp (regexp-opt x-keywords 'words))
            (x-types-regexp (regexp-opt x-types 'words))
            (x-constants-regexp (regexp-opt x-constants 'words))
            (x-events-regexp (regexp-opt x-events 'words))
            (x-functions-regexp (regexp-opt x-functions 'words)))
        `(
          (,x-types-regexp . font-lock-type-face)
          (,x-constants-regexp . font-lock-constant-face)
          (,x-events-regexp . font-lock-builtin-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          )))

(defvar kamailio-mode-syntax-table nil "Syntax table for `kamailio-mode'.")

(setq kamailio-mode-syntax-table
      (let ( (synTable (make-syntax-table)))
        (modify-syntax-entry ?# "<" synTable)
        (modify-syntax-entry ?\n ">" synTable)
        synTable))

(define-derived-mode kamailio-mode c-mode "kamailio mode"
  "Major mode for editing Kamailio configuration files"
  (setq font-lock-defaults '((kamailio-font-lock-keywords)))
  (set-syntax-table kamailio-mode-syntax-table))

(provide 'kamailio-mode)
