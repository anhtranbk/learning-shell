#!/bin/bash
# write an email to admin 
mail -s 'Backup status' anhtn.bk@gmail.com<<END_OF_EMAIL

The backup job finished.

End date: $(date)
Hostname : $(hostname)

END_OF_EMAIL
