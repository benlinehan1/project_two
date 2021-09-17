require 'pg'
require_relative '../lib/helpers.rb'

def run_sql(sql)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'project_two'})
    results = db.exec(sql)
    db.close
    return results

end

def create_content(title, content, image_url, username)
    sql = "INSERT INTO posts (title, content, image_url, username) VALUES ('#{title}', '#{content}', '#{image_url}', '#{username}');"
    
    return run_sql(sql)
end

def find_all_posts()
    sql = "SELECT * FROM posts;"
    return run_sql(sql)
end

def find_post_by_id(id) 
    sql = "SELECT * FROM posts WHERE id = #{id};"
    return run_sql(sql)[0]
end

def delete_post(id)
    sql = "DELETE FROM posts WHERE id = '#{id}'"
    return run_sql(sql)
end

def update_post(id, title, content, image_url)
    sql = "UPDATE posts SET title = '#{title}', content = '#{content}', image_url = '#{image_url}' WHERE ID = #{id};"
    

    return run_sql(sql)
end

def get_comments(id)
    sql = "SELECT * FROM comments WHERE post_id = #{id}"

    return run_sql(sql)
    
end

def make_a_comment(comment, username, post_id)
    sql = "INSERT INTO comments (comment, username, post_id) VALUES ('#{comment}', '#{username}', '#{post_id}');"
    return run_sql(sql)
end

def delete_a_comment(id) 
    sql = "DELETE FROM comments WHERE id = #{id}"

    return run_sql(sql)
end