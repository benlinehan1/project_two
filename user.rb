require 'pg'


def create_user(username, email,password_digest)

    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'project_two'})
    sql = "INSERT INTO users (username, email, password_digest) VALUES ('#{username}', '#{email}', '#{password_digest}') returning *;"
    results = db.exec(sql)
    db.close

    return results[0]

end

def find_user_by_email(email)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'project_two'})
    sql = "SELECT * FROM users WHERE email = '#{email}';"
    result = db.exec(sql)
    db.close

    if result.count > 0
        return result[0]
    else 
        return false
    end
end

def find_user_by_id(id)
    if id == nil
        return false
    end
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'project_two'})
    sql = "SELECT * from users where id = #{id};"
    result = db.exec(sql)
    db.close

    if result.count > 0
        return result[0]
      else
        return false
    end
end