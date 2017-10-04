create or replace procedure htpc (z clob) is
  v_read_amount     integer   := 32767;
  v_read_offset     integer   := 1;
  v_buffer          varchar2(32767);
begin


     begin
      loop
        dbms_lob.read(z,v_read_amount,v_read_offset,v_buffer);
        htp.prn(v_buffer);
        v_read_offset := v_read_offset + v_read_amount;
        v_read_amount := 32767;
      end loop;
     exception
      when no_data_found then
         null;
     end;

     exception
      when others then
        null; --showHTMLdoc(p_id);

end;
