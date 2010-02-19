class Application < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :unit
  validates_presence_of :unit_id, :tenant_id
  validates_inclusion_of  :status,
                          :in => %w{N A R},
                          :message => "The valid countries are USA"

  composed_of :employment_history,
              :class_name => "EmploymentHistory",
              :mapping =>
              [ #   database                  ruby
                %w[ current_employer_name             current_name   ],
                %w[ current_employer_address          current_address   ],
                %w[ current_employer_supervisor_name  current_supervisor_name   ],
                %w[ current_employer_supervisor_phone current_supervisor_phone   ],
                %w[ current_employer_title            current_title   ],
                %w[ previous_employer_name            previous_name   ],
                %w[ previous_employer_address         previous_address   ],
                %w[ previous_employer_supervisor_name previous_supervisor_name   ],
                %w[ previous_employer_supervisor_phone previous_supervisor_phone   ],
                %w[ previous_employer_title            previous_title   ],
              ]
  composed_of :rental_history,
              :class_name => "RentalHistory",
              :mapping =>
              [ #   database                  ruby
                %w[ current_rental_address            current_address   ],
                %w[ current_rental_date               current_date   ],
                %w[ current_rental_vacate_reasaon     current_vacate_reason   ],
                %w[ current_rental_landlord_name      current_landlord_name   ],
                %w[ current_rental_landlord_phone      current_landlord_phone   ],
                %w[ previous_rental_address           previous_address   ],
                %w[ previous_rental_date              previous_date   ],
                %w[ previous_rental_vacate_reasaon    previous_vacate_reason   ],
                %w[ previous_rental_landlord_name     previous_landlord_name   ],
                %w[ previous_rental_landlord_phone    previous_landlord_phone   ],
                %w[ other_rental_address              other_address   ],
                %w[ other_rental_date              other_date   ],
                %w[ other_rental_vacate_reasaon    other_vacate_reason   ],
                %w[ other_rental_landlord_name     other_landlord_name   ],
                %w[ other_rental_landlord_phone    other_landlord_phone   ]
              ]
  composed_of :costs,
              :class_name => "ApplicationCosts",
              :mapping =>
              [ #   database                  ruby
                %w[ first_month_cost        first_month      ],
                %w[ security_deposit_cost   security_deposit   ],
                %w[ credit_check_cost       credit_check   ],
                %w[ other_amount_cost       other   ]
              ]

  composed_of :income,
              :class_name => "Income",
              :mapping =>
              [ #   database                  ruby
                %w[ gross_income              gross      ],
                %w[ other_income              other   ]
              ]              
  composed_of :bank_info,
              :class_name => "ApplicationBankInfo",
              :mapping =>
              [ #   database                  ruby
                %w[ savings_account           savings_account      ],
                %w[ savings_bank              savings_bank   ],
                %w[ savings_branch            savings_branch   ]
              ]
  composed_of :credit_info,
              :class_name => "ApplicationCreditInfo",
              :mapping =>
              [ #   database                  ruby
                %w[ credit_type               credit_type      ],
                %w[ credit_account            credit_account   ],
                %w[ credit_name               credit_name   ],
                %w[ credit_owed               credit_owed   ],
                %w[ credit_payment            credit_payment   ],
                %w[ loan_payment            loan_owed   ],
                %w[ loan_payment            loan_payment   ]
              ]

  def deliver_application_rejected_email
    AccountMailer.deliver_application_for_unit_rejected(self)
  end

  def deliver_update_email(editing_user,notified_user)
    AccountMailer.deliver_application_update_for_unit(editing_user, notified_user, self)
  end

  def deliver_new_application_email(from_user, to_user)
    AccountMailer.deliver_application_for_unit(to_user, from_user, self)
  end
end
