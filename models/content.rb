require 'pg'
require_relative '../lib/helpers.rb'

def create_content(title, content, image_url, username)
    db = PG.connect(dbname: 'project_two')
    sql = "INSERT INTO posts (title, content, image_url, username) VALUES ('#{title}', '#{content}', '#{image_url}', '#{username}');"
    db.exec(sql)
    db.close
end

def find_all_posts()
    db = PG.connect(dbname: 'project_two')
    sql = "SELECT * FROM posts;"
    results = db.exec(sql)
    db.close
    
    return results
end

def find_post_by_id(id) 
    db = PG.connect(dbname: 'project_two')
    sql = "SELECT * FROM posts WHERE id = #{id};"
    puts id
    result = db.exec(sql)
    db.close

    return result[0]
end

def delete_post(id)
    db = PG.connect(dbname: 'project_two')
    sql = "DELETE FROM posts WHERE id = '#{id}'"
    result = db.exec(sql)
    db.close

    return result
end

def update_post(id, title, content, image_url)
    db = PG.connect(dbname: 'project_two')
    sql = "UPDATE posts SET title = '#{title}', content = '#{content}', image_url = '#{image_url}' WHERE ID = #{id};"
    result = db.exec(sql)
    db.close

    return result
end

# def get_comments(id)
#     db = PG.connect(dbname: 'project_two')
    
# end